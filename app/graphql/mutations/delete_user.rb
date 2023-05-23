module Mutations
  class DeleteUser < BaseMutation
    # TODO: define return fields
    field :user, Types::UserType, null: false

    # TODO: define arguments
    argument :id, ID, required: true

    # TODO: define resolve method
    def resolve(id:)
      # binding.pry
      user = User.find(id)
      user.destroy
      {user: user}
      rescue ActiveRecord::RecordNotFound => e 
        raise GraphQL::ExecutionError.new("Record Not Found!")
      end
    
  end
end
