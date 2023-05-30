module Mutations
  class Comments::UpdateComment < BaseMutation
    # TODO: define return fields
    field :comment, Types::CommentType, null: false

    # TODO: define arguments
    argument :attributes, Types::Comments::UpdatecommentattributesInputType
    field :errors, [String]

    # TODO: define resolve method
    def resolve(attributes:)
      comment = Comment.find_by(id: attributes.id)
      raise GraphQL::ExecutionError.new("Comment Doesn't exists.") if comment.nil?
      # binding.pry
      if comment.user_id == attributes.user_id
        comment.update(body: attributes.body,user_id: attributes.user_id, post_id: attributes.post_id)
          { comment: comment, errors: [] }
      else
        comment.errors.add(:permission, "You are not the owner of Comment.")
          { comment: nil, errors: comment.errors.full_messages }
      end
    end
  end
end
