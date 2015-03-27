require 'shadow_form/version'

class ShadowForm
  class << self
    def form_config
      @form_config ||= {}
    end

    def shadow_of(klass)
      core_config[:shadow_of] = klass
    end

    def validation(&block)
      core_config[:validation] = block
    end

    def rename(new_name)
      core_config[:new_name] = new_name
    end

    def new
      klass = core_config[:shadow_of] || fail('[ShadowForm] missing shadow class')
      Class.new(klass).tap do |m_class|
        new_name = core_config[:new_name] || klass.to_s
        m_class.class_eval("def self.name; \"#{new_name}\"; end")
        m_class.class_eval(&validation) if validation
      end
    end
  end
end
