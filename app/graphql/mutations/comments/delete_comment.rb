module Mutations
  class Comments::DeleteComment < BaseMutation
    # TODO: define return fields
    field :comment, Types::CommentType, null: false

    # TODO: define arguments
    argument :id, ID, required: true

    # TODO: define resolve method
    def resolve(id:)
      comment = Comment.find_by(id: id)
      raise GraphQL::ExecutionError.new("Record Doesn't exists.") if comment.nil?
      comment.destroy
      { comment: comment }
    end
  end
end
