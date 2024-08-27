module Resolvers
  class BaseResolver < GraphQL::Schema::Resolver
    include ::GraphqlAuthenticationConcerns
  end
end
