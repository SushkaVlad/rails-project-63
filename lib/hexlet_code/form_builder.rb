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
      as = options.delete(:as) || :input
      value = @user.public_send(user_field).to_s
      @fields << Field.new(as, user_field, value, options)
    end

    def submit(value = "Save")
      @fields << Field.new(:submit, nil, value, options: {})
    end
  end
end
