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
      @@form_class ||= (
        klass = form_config[:shadow_of] || fail('[ShadowForm] missing shadow class')
        Class.new(klass).tap do |m_class|
          if form_config[:new_name]
            Object.const_set(form_config[:new_name], m_class)
          else
            m_class.class_eval("def self.name; \"#{form_config[:shadow_of]}\"; end")
          end
          m_class.class_eval(&form_config[:validation])     if form_config[:validation]
        end
      )
    end

    def form_config
      @form_config ||= {}
    end
  end
end
