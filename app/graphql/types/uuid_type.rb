module Types
  class UuidType < Types::BaseScalar
    description 'A UUID (Universally Unique Identifier)'

    def self.coerce_input(input_value, _context)
      UUIDTools::UUID.parse(input_value)
    rescue UUIDTools::UUID::InvalidUUIDError
      raise GraphQL::CoercionError, "#{input_value} is not a valid UUID"
    end

    def self.coerce_result(ruby_value, _context)
      ruby_value.to_s
    end
  end
end
