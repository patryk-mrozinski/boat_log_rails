module Formaters
  class User < Base
    attr_reader :user

    def initialize(response, user)
      super(response)
      @user = user
    end

    def self.format(response, user)
      new(response, user).format_response
    end

    private

    def success_response
      {
        token: @response.object,
        user:  @user,
        **super
      }
    end

    def fail_response
      {
        token: @response.object,
        user:  nil,
        **super
      }
    end
  end
end
