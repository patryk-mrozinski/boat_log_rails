module Mutations
  module Users
    class SignUp < Mutations::BaseMutation
      argument :email, String, required: true
      argument :first_name, String, required: true
      argument :last_name, String, required: true
      argument :password, String, required: true

      field :success, Boolean
      field :error, String

      def resolve(args)
        response = ::Users::Create.new.call(args)

        Formaters::Base.format(response)
      end
    end
  end
end
