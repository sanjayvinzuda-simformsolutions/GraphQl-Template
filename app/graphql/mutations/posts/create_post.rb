module Mutations
  class Posts::CreatePost < BaseMutation
    # TODO: define return fields
    field :post, Types::PostType, null: false

    # TODO: define arguments
    argument :attributes, Types::Posts::CreatepostattributesInputType, required: true
    field :errors, [String]
    # TODO: define resolve method
    def resolve(attributes:)
      post = Post.new(attributes.to_h)
      if post.save 
        { post: post, errors: [] }
      else
        { post: post, errors: post.errors.full_messages }
      end
    end
  end
end
