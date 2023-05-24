module Mutations
  class Posts::DeletePost < BaseMutation
    # TODO: define return fields
    field :post, Types::PostType, null: false

    # TODO: define arguments
    argument :id, ID, required: true

    # TODO: define resolve method
    def resolve(id:)
      post = Post.find(id)
      post.destroy
      {
        post: post
      }
    rescue ActiveRecord::RecordNotFound => e 
      raise GraphQL::ExecutionError.new(e.message)
    end
  end
end
