module Mutations
  class Posts::UpdatePost < BaseMutation
    # TODO: define return fields
    field :post, Types::PostType, null: false

    # TODO: define arguments
    argument :attributes, Types::Posts::UpdatepostattributesInputType, required: true
    field :errors, [String], null: false
    

    # TODO: define resolve method
    def resolve(attributes:)
      post = Post.find_by(id: attributes.id)
      raise GraphQL::ExecutionError.new("Record Doesn't exists.") if post.nil?
      if post.user_id == attributes.user_id 
        post.update(title: attributes.title, body: attributes.body, user_id: attributes.user_id)
        { post: post, errors: [] }
      else
            post.errors.add(:permission, "You are not the owner of this post.")
          {  post: nil, errors: post.errors.full_messages }
      end
    end
  end
end
