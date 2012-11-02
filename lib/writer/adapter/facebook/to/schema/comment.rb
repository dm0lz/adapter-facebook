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
                    {
                      "type" => [
                        @source[:author][:_type]
                      ],
                      "properties" => {  
                        "additionalType" => [
                          @source[:author][:additionalType]
                        ],
                        "http://getfetcher.net/Item#id" => [
                          @source[:author][:id]
                        ],
                        "name" => [
                          @source[:author][:name]
                        ]
                      }
                    }
                  ],
                  "text" => [
                    @source.text
                  ],
                  "created_time" => [
                    @source.created_time
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