# frozen_string_literal: true

module Types
  class Users::UserattributesInputType < Types::BaseInputObject
    argument :name, String, required: true
    argument :age, Integer, required: true
    argument :email, String, required: true
  end
end
