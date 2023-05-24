# frozen_string_literal: true

module Types
  class Posts::CreatepostattributesInputType < Types::BaseInputObject
    argument :title, String, required: true
    argument :body, String, required: true
    argument :user_id, ID, required: true
  end
end
