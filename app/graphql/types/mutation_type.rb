module Types
  class MutationType < Types::BaseObject
    field :update_comment, mutation: Mutations::Comments::UpdateComment
    field :delete_comment, mutation: Mutations::Comments::DeleteComment
    field :create_comment, mutation: Mutations::Comments::CreateComment
    field :update_post, mutation: Mutations::Posts::UpdatePost
    field :create_post, mutation: Mutations::Posts::CreatePost
    field :delete_post, mutation: Mutations::Posts::DeletePost
    field :update_user, mutation: Mutations::UpdateUser
    field :delete_user, mutation: Mutations::DeleteUser
    field :create_user, mutation: Mutations::CreateUser
   
  end
end
