class ApplicationService
  class Result
    attr_reader :errors, :object, :success

    def initialize(success:, errors: [], object: nil)
      @errors = errors
      @success = success
      @object = object
    end

    def success?
      success
    end
  end
end
