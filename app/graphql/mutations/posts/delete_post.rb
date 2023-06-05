module Mutations
  class Posts::DeletePost < BaseMutation
    # TODO: define return fields
    field :post, Types::PostType, null: false

    # TODO: define arguments
    argument :id, ID, required: true
    argument :user_id, Integer, required: true
    # TODO: define resolve method
    def resolve(id:,user_id:)
      post = Post.find_by(id: id)
      
      raise GraphQL::ExecutionError.new("Record Not Found") if post.nil?
      if post.user_id == user_id
        post.destroy
        { post: post }
      else
        { post: nil }
        raise GraphQL::ExecutionError.new("You are not authorized to delete this post")
      end
    end
  end
end
