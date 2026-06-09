# frozen_string_literal: true

require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.setup

require_relative "hexlet_code/version"

# Generates HTML forms from plain Ruby objects (entities).
module HexletCode
  class Error < StandardError; end

  def self.form_for(model, **attributes, &block)
    action = attributes.delete(:url) || "#"
    form_attributes = { action: action, method: "post", **attributes }
    Tag.build("form", **form_attributes) { block.call(model) }
  end
end
