module Resolvers
  class Boats < BaseResolver
    def resolve

      Boat.all
    end
  end
end
