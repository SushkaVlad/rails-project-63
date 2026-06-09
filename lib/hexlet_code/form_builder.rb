# frozen_string_literal: true

module HexletCode
  # Collects form fields built from an entity's attributes.
  class FormBuilder
    attr_reader :fields

    def initialize(user)
      @user = user
      @fields = []
    end

    def input(user_field, **options)
      as = options.delete(:as)
      value = @user.public_send(user_field).to_s
      if as == :text
        attributes = { name: user_field, cols: 20, rows: 40, **options }
        @fields << Tag.build("textarea", **attributes) { value }
      else
        attributes = { name: user_field, type: "text", value: value, **options }
        @fields << Tag.build("input", **attributes)
      end
    end
  end
end
