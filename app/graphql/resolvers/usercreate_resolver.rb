module Resolvers
    class UsercreateResolver < Resolvers::BaseResolver
        type Types::UserType, null: true
       

        argument :name, String, required: true
        argument :age, Integer, required: true
        argument :email, String, required: true

        def resolve(name:,age:,email:)
            User.create(name: name,age: age, email: email)
           
        end
    end
end
