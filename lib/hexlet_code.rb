# frozen_string_literal: true

require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.setup

require_relative "hexlet_code/version"

# Generates HTML forms from plain Ruby objects (entities).
module HexletCode
  class Error < StandardError; end

  def self.form_for(user, **attributes, &block)
    form_builder = FormBuilder.new(user)
    block&.call(form_builder)
    action = attributes.delete(:url) || "#"
    form_attributes = { action: action, method: "post", **attributes }
    renderer = Renderers::Html.new
    Tag.build("form", **form_attributes) { form_builder.fields.map { |field| renderer.render(field) }.join }
  end
end
