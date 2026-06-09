# frozen_string_literal: true

module HexletCode
  module Renderers
    # Renders form field descriptions into HTML strings.
    class Html
      def render(field)
        case field.type
        when :input  then render_input(field)
        when :text   then render_textarea(field)
        when :submit then render_submit(field)
        else
          raise ArgumentError, "Unknown field type: #{field.type}"
        end
      end

      private

      def render_label(name)
        Tag.build("label", for: name) { name.to_s.capitalize }
      end

      def render_input(field)
        input = Tag.build("input", name: field.name, type: "text", value: field.value, **field.options)
        render_label(field.name) + input
      end

      def render_textarea(field)
        textarea = Tag.build("textarea", name: field.name, cols: 20, rows: 40, **field.options) { field.value }
        render_label(field.name) + textarea
      end

      def render_submit(field)
        Tag.build("input", type: "submit", value: field.value)
      end
    end
  end
end
