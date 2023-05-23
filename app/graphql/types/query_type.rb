module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # Here we are retrieving 
    field :users, [Types::UserType], null: false

    # here count the total number of users
    field :user_count, Int, null: false

    # retrieve a specific record from the database
    field :find_user, Types::UserType, null: true do
      argument :id, ID, required: true
    end

    # retrieve all posts with it's user

    field :posts, [Types::PostType], null: false


    def users
      User.all
    end

    def user_count
      User.count
    end

    def find_user(id:)
      user = User.find(id)
    rescue ActiveRecord::RecordNotFound => e
      raise GraphQL::ExecutionError.new(e.message)
    end

    def posts
      Post.all
    end

  end
end
