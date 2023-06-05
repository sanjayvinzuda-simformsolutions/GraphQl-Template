# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :age, Integer
    field :email, String
    field :commentCount, Integer
    field :postCount, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def commentCount
      object.comments.count
    end

    def postCount 
      object.posts.count
    end

  end
end
