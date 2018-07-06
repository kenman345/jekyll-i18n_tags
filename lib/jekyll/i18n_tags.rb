# -*- coding: utf-8 -*-

module Jekyll
  class I18NTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text.strip
    end

    def render(context)
      lang = context['page']['lang']
      raise "Page language not specified: #{context['page']['path']}" unless lang
      source_lang ||= context['site']['source_lang']
      if lang == source_lang
        @text
      else
        translation_data ||= begin
          if context['site']['translations_source'].nil?
            context['site']['translations']
          else
            context['site']['data'][context['site']['translations_source']]
          end
        end
        translations = translation_data[lang]
        raise 'Translations not provided' unless translations
        translation = translations[@text]
        raise "Translation not provided: #{@text}" unless translation
        translation
      end
    end
  end
end

Liquid::Template.register_tag('t', Jekyll::I18NTag)
