module Writer
  module Adapter
    module Facebook
      module To
        module Schema
          class Post
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
                  "id" => [
                    @source.id
                  ],
                  "text" => [
                    @source.text
                  ],
                  "created_time" => [
                    @source.created_time
                  ],
                  "author" => [
                    @source[author].hash
                  ],
                  "aggregateRating" => [
                    {
                      "type" => [
                        @source[likes_type]
                      ],
                      "properties" => {
                        "ratingCount" => [
                          @source[likes_count]
                        ],
                        "author"=> [
                        ]
                      }
                    }
                  ],
                  "comment" => [                 
                  ]
                }
              }

              @source[likes].each do |like|
                @attributes[properties][author].push(like.hash)
              end

              @source[comments].each do |comment|
                @attributes[properties][comment].push(comment.hash)
              end 
            end


          end
        end
      end
    end
  end
end