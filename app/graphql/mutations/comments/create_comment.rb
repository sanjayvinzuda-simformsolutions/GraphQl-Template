module Mutations
  class Comments::CreateComment < BaseMutation
    # TODO: define return fields
    field :comment, Types::CommentType, null: false

    # TODO: define arguments
    argument :attributes, Types::Comments::CommentattributesInputType
    field :errors, [String], null: false

    # TODO: define resolve method
    def resolve(attributes:)
        comment = Comment.new(attributes.to_h)
        if comment.save
          { comment: comment, errors: [] }
        else
          { comment: nil, errors: comment.errors.full_messages }
        end
    end
  end
end
