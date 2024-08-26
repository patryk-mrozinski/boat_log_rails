module Formaters
  class Base
    attr_reader :response

    def initialize(response)
      @response = response
    end

    def self.format(response)
      new(response).format_response
    end

    def format_response
      response.success? ? success_response : fail_response
    end

    def success_response
      {
        success: true,
        error: ''
      }
    end

    def fail_response
      {
        success: false,
        error: response.errors.join(', ')
      }
    end
  end
end
