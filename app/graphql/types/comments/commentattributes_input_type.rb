# frozen_string_literal: true

module Types
  class Comments::CommentattributesInputType < Types::BaseInputObject
    argument :body, String, required: true
    argument :user_id, Integer, required: true
    argument :post_id, Integer, required: true
  end
end
