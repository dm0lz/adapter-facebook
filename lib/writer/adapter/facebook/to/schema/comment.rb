module Writer
  module Adapter
    module Facebook
      module To
        module Schema
          class Comment
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
                "properties"=> {
                  "id"=> [
                    @source.id
                  ],
                  "author" => [
                    
                  ],
                  "text" => [
                    @source.text
                  ],
                  "created_time" => [
                    @source.created_time
                  ]
                }
              }

              @attributes[author].push(@source[author].hash)
            end


          end
        end
      end
    end
  end
end