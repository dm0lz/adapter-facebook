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
                  ]
                  "author" => [
                    {
                      "type": [
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
                  "aggregateRating" => [
                    {
                      "type" => [
                        @source[likes_type]
                      ],
                      "properties" => {
                        "ratingCount" => [
                          @source[likes_count]
                        ],

                        ##PREGUNTAR A FER COMO HACER PARA RECORRER LA 
                        ##LISTA Q IR AGREGANDO OBJETOS ANONIMOS AL HASH
                        "author": [
                          {
                            "type": [
                              "http://schema.org/Person/User"
                            ],
                            "properties": {  
                              "additionalType": [
                                "http://getfetcher.net/Item"
                              ],
                              "http://getfetcher.net/Item#id": [
                                "536017463"
                              ],
                              "name": [
                                "Nahuel García Ocampo"
                              ]
                            }           
                          },
                          {
                            "type": [
                              "http://schema.org/Person/User"
                            ],
                            "properties": {  
                              "additionalType": [
                                "http://getfetcher.net/Item"
                              ],
                              "http://getfetcher.net/Item#id": [
                                "1002769970"
                              ],
                              "name": [
                                "Luis Suas"
                              ]
                            }
                          },
                          {
                            "type": [
                              "http://schema.org/Person/User"
                            ],
                            "properties": {  
                              "additionalType": [
                                "http://getfetcher.net/Item"
                              ],
                              "http://getfetcher.net/Item#id": [
                                "1060147124"
                              ],
                              "name": [
                                "Sol Laborde"
                              ]
                            }
                          }
                        ]
                      }
                    }
                  ],
                  "comment": [
                    {
                      "type": [
                        "http://schema.org/UserComments"
                      ],
                      "properties": {
                        "id": [
                          "735576666_10151298637466667_26116437"
                        ],
                        "author": [
                          {
                            "type": [
                              "http://schema.org/Person/User"
                            ],
                            "properties": {  
                              "additionalType": [
                                "http://getfetcher.net/Item"
                              ],
                              "http://getfetcher.net/Item#id": [
                                "1265409676"
                              ],
                              "name": [
                                "Facu Vivas"
                              ]
                            }
                          }
                        ],
                        "text": [
                          "ser o no ser? jaja"
                        ],
                        "created_time": [
                          "2012-10-27T15:27:29+0000"
                        ]
                      }
                    },
                    {
                      "type": [
                        "http://schema.org/UserComments"
                      ],
                      "properties": {
                        "id": [
                          "735576666_10151298637466667_26116661"
                        ],
                        "author": [
                          {
                            "type": [
                              "http://schema.org/Person/User"
                            ],
                            "properties": {  
                              "additionalType": [
                                "http://getfetcher.net/Item"
                              ],
                              "http://getfetcher.net/Item#id": [
                                "600129837"
                              ],
                              "name": [
                                "Conrado Mader Blanco"
                              ]
                            }
                          }
                        ],
                        "text": [
                          "che vos sabes mucha Inglé no?"
                        ],
                        "created_time": [
                          "2012-10-27T15:45:12+0000"
                        ]
                      }
                    }
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