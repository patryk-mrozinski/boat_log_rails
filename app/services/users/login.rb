module Users
  class Login < ApplicationService
    def call(password, user)
      if user&.valid_password?(password)
        token = Warden::JWTAuth::UserEncoder.new.call(user, :user, nil).first

        Result.new(success: true, object: token  )
      else
        Result.new(success: false, errors: ['Invalid credentials'])
      end
    end
  end
end