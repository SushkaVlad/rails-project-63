# frozen_string_literal: true

module HexletCode
  # Builds HTML tags, both single (<br>) and paired (<div></div>).
  class Tag
    SINGLE_TAGS = %w[br img input hr].freeze
    def self.build(name, **attributes, &block)
      html_attributes = attributes.map { |key, value| " #{key}=\"#{value}\"" }.join
      if SINGLE_TAGS.include?(name)
        "<#{name}#{html_attributes}>"
      else
        "<#{name}#{html_attributes}>#{block ? block.call : ""}</#{name}>"
      end
    end
  end
end
