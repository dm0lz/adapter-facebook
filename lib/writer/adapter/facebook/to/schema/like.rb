module Writer
  module Adapter
    module Facebook
      module To
        module Schema
          class Like

            attr_reader :source

            def initialize source
              @source = source
            end

            def hash
              @attributes = @source.attributes
              {
                "type" => [
                  @source[:_type]
                ],
                "properties" => {
                  "additionalType" => [
                    @attributes[:author][:additionalType]
                  ],
                  "http://getfetcher.net/Item#id" => [
                    @attributes[:author][:id]
                  ],
                  "name" => [
                    @attributes[:author][:name]
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