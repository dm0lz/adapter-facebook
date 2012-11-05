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
              resp = {
                "type" => [
                  @source[:_type]
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
              resp
            end
          end
        end
      end
    end
  end
end