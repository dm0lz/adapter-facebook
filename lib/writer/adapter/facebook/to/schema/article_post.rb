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
              resp = 
              {
                "type" => [
                  @source[:_type]
                ],
                "properties" => {
                  "id" => [
                    @attributes[:id]
                  ],
                  "text" => [
                    @attributes[:text]
                  ],
                  "created_time" => [
                    @attributes[:created_time]
                  ],
                  "author" => [
                    @attributes[:author].to.hash
                  ],
                  "aggregateRating" => [
                    {
                      "type" => [
                        @attributes[:likes_type]
                      ],
                      "properties" => {
                        "ratingCount" => [
                          @attributes[:likes_count]
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

              @attributes[:likes].each do |like|
                resp["properties"]["aggregateRating"][0]["properties"]["author"].push(like.to.hash)
              end

              @attributes[:comments].each do |comment|
                resp["properties"]["comment"].push(comment.to.hash)
              end
              resp

            end

            

          end
        end
      end
    end
  end
end