module Mutations
  module Users
    class SignIn < Mutations::BaseMutation
      argument :email, String, required: true
      argument :password, String, required: true

      field :token, String
      field :success, Boolean
      field :error, String
      field :user, Types::UserType

      def resolve(email:, password:)
        user = ::User.find_for_authentication(email: email)
        response = ::Users::Login.new.call(password, user)

        Formaters::User.format(response, user)
      end
    end
  end
end