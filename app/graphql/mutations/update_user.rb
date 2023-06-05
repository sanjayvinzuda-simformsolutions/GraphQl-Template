module Mutations
  class UpdateUser < BaseMutation
    # TODO: define return fields
    field :user, Types::UserType, null: false

    argument :attributes, Types::Users::UpdateuserattributesInputType, required: true

    # TODO: define resolve method
    def resolve(attributes:)
      user = User.find(attributes.id)
      rescue ActiveRecord::RecordNotFound => e
        raise GraphQL::ExecutionError.new(e.message)
      if user.update(name: attributes.name, age: attributes.age, email: attributes.email)
        { user: user }
      else
        { user: nil }
      end
    end
  end
end
