class ShadowForm
  class << self
    def shadow_of(klass)
      form_config[:shadow_of] = klass
    end

    def validation(&block)
      form_config[:validation] = block
    end

    def give_name(new_name)
      form_config[:new_name] = new_name
    end

    def new(*args)
      form_class.new(*args)
    end

    private

    def form_class
      @form_class ||= (
        klass      = form_config[:shadow_of] || fail('[ShadowForm] missing shadow class')
        klass_name = form_config.fetch(:new_name, name)
        Class.new(klass).tap do |m_class|
          self.const_set('ShadowForm', m_class)
          m_class.class_eval("def self.name; \"#{klass_name}\"; end")
          m_class.class_eval(&form_config[:validation]) if form_config[:validation]
        end
      )
    end

    def form_config
      @form_config ||= {}
    end
  end
end
