# frozen_string_literal: true

module Types
  class Users::UpdateuserattributesInputType < Types::BaseInputObject
    argument :id, ID, required: true
    argument :name, String, required: true
    argument :age, Integer, required: true
    argument :email, String, required: true
  end
end
