module Mutations
  class Posts::UpdatePost < BaseMutation
    # TODO: define return fields
    field :post, Types::PostType, null: false

    # TODO: define arguments
    argument :attributes, Types::Posts::UpdatepostattributesInputType, required: true
    

    # TODO: define resolve method
    def resolve(attributes:)
      post = Post.find(attributes.id)
    if post.update(title: attributes.title, body: attributes.body, user_id: attributes.user_id)
          { post: post }
      else
          {  post: nil }
      end
    end
  end
end
