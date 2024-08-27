module Resolvers
  class Boats < BaseResolver
    def resolve
      authenticate_user!

      Boat.all
    end
  end
end
