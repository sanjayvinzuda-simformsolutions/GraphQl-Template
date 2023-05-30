module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField


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

    # To retrive a specific record of post
    field :find_post, Types::PostType, null: false do
      argument :id, ID, required: true
    end

    # Retrieve all the comments here 
    field :comments, [Types::CommentType], null: false

    # retrieve a particular comment 
    field :find_comment, Types::CommentType, null: false do
      argument :id, ID, required: true
    end

    # comment counts
    field :comment_count, Int

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

    def find_post(id:)
      post = Post.find(id)
        rescue ActiveRecord::RecordNotFound => e
          raise GraphQL::ExecutionError.new(e.message)
    end

    def comments
      Comment.all
    end

    def find_comment(id:)
        comment = Comment.find(id)
        rescue ActiveRecord::RecordNotFound => e
          raise GraphQL::ExecutionError.new(e.message)
    end

    def comment_count
      Comment.count
    end

  end
end
