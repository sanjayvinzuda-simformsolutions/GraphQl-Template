# frozen_string_literal: true

module Types
  class Posts::UpdatepostattributesInputType < Types::BaseInputObject
    argument :id, ID, required: true
    argument :title, String, required: true
    argument :body, String, required: true
    argument :user_id, Integer, required: true
  end
end
