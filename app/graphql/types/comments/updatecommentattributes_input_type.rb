# frozen_string_literal: true

module Types
  class Comments::UpdatecommentattributesInputType < Types::BaseInputObject
    argument :id, ID, required: true
    argument :body, String, required: true
    argument :user_id, Integer, required: true
    argument :post_id, Integer, required: true
  end
end
