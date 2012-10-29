module Writer
  module Adapter
    module Facebook
      module To
        module Schema
          class PersonUser
            attr_reader :source
            def initialize source
              @source = source
            end
            def hash
               @attributes = @source.attributes
              {
                "type" => [
                  @source._type
                ],
                "properties" => {
                  "additionalType" => [
                    @attributes[:additionalType]
                  ],
                  "http://getfetcher.net/Item#id" => [
                    @attributes[:id]
                  ],
                  "name" => [
                    @attributes[:name]
                  ]
                }
              }
            end
          end
        end
      end
    end
  end
end