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
              resp = 
              {
                "type" => [
                  @source[:_type]
                ],
                "properties"=> {
                  "id"=> [
                    @attributes[:id]
                  ],
                  "author" => [
                    
                  ],
                  "text" => [
                    @attributes[:text]
                  ],
                  "created_time" => [
                    @attributes[:created_time]
                  ]
                }
              }
              resp["properties"]["author"].push(@attributes[:author].to.hash)

              resp
            end


          end
        end
      end
    end
  end
end