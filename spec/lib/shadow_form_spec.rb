require 'spec_helper'
require 'active_model'

describe ShadowForm do

  class PersonModel
    include ActiveModel::Model
    attr_accessor :name, :age
  end

  def subject_class
    Class.new(described_class).tap do |klass|
      klass.class_eval do
        shadow_of PersonModel
        give_name 'PersonForm'
        validation do
          validates :name, presence: true
          validates :age, numericality: { only_integer: true, greater_than: 17}
        end
      end
    end
  end

  let(:attributes) { {} }
  subject { subject_class.new(attributes) }

  it '.name is set by self.give_name method' do
    expect(subject.class.name).to eq('PersonForm')
  end

  it 'form class ancestors include PersonModel' do
    expect(subject.class.ancestors).to include(PersonModel)
  end

  it 'validation is present' do
    expect(subject.valid?).to eq(false)
    expect(subject.errors.as_json).to eq(name: ["can't be blank"], age: ['is not a number'])
  end
end
