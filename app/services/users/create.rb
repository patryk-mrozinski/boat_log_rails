module Users
  class Create < ApplicationService
    def call(params)
      user = User.new(params)

      if user.save
        Result.new(success: true, object: user)
      else
        Result.new(success: false, errors: user.errors.full_messages)
      end
    end
  end
end
