module Adapter
  module Facebook
    module To
      module Schema
        class PersonUser
          include Virtus
          include Discoverer::Writer
          attr_reader :_type
          attribute :name
          attribute :id
          attribute :additionalType


          def initialize facebook_user
            @_type = "http://schema.org/Person/User"
            coerce facebook_user
          end

          def coerce facebook_user
            @id             = facebook_user["id"]
            @name           = facebook_user["name"]
            @additionalType = "http://getfetcher.net/Item"
          end

        end
      end
    end
  end
end