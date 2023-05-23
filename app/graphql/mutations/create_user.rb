module Mutations
  class CreateUser < BaseMutation
    # TODO: define return fields
    field :user, Types::UserType, null: false

    # TODO: define arguments
    argument :attributes, Types::Users::UserattributesInputType, required: true
    field :errors, [String]

    # TODO: define resolve method
    def resolve(attributes:)
      user = User.new(attributes.to_h)
      if user.save
        { user: user, errors: [] }
      else
        { user: nil, errors: user.errors.full_messages }
      end

    end
  end
end
