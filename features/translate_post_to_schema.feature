Feature: Translate facebook to schema.org/Person/User + getfetcher.net/Item

  In order to send a standardized-properties form of the facebook information
  As a developer 
  I want to be able to convert from Facebook API to 
  schema.org based vocabulary

  Scenario: Converting a json facebook post into a json schema
  Given the facebook post:

  """
  {
      "id": "735576666_10151298637466667", 
      "from": {
        "name": "Tomás Mehdi", 
        "id": "735576666"
      }, 
      "message": "Be ready for not be ready", 
      "type": "status", 
      "status_type": "mobile_status_update", 
      "created_time": "2012-10-27T15:18:35+0000", 
      "updated_time": "2012-10-27T15:45:12+0000", 
      "likes": {
        "data": [
          {
            "name": "Nahuel García Ocampo", 
            "id": "536017463"
          }, 
          {
            "name": "Luis Suas", 
            "id": "1002769970"
          }, 
          {
            "name": "Sol Laborde", 
            "id": "1060147124"
          }
        ], 
        "count": 3
      }, 
      "comments": {
        "data": [
          {
            "id": "735576666_10151298637466667_26116437", 
            "from": {
              "name": "Facu Vivas", 
              "id": "1265409676"
            }, 
            "message": "ser o no ser? jaja", 
            "created_time": "2012-10-27T15:27:29+0000"
          }, 
          {
            "id": "735576666_10151298637466667_26116661", 
            "from": {
              "name": "Conrado Mader Blanco", 
              "id": "600129837"
            }, 
            "message": "che vos sabes mucha Inglé no?", 
            "created_time": "2012-10-27T15:45:12+0000", 
            "likes": 2
          }
        ], 
        "count": 2
      }
    }

  """

  When I convert it into schema.org/Article
  Then I should have :

  """ 
{
	"type": [
		"http://schema.org/Article"
	],
	"properties": {
		"text": [
			"Be ready for not be ready"
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
			      735576666
			    ],
			    "name": [
			      "Tomás Mehdi"
			    ]
			  }
			}
		],
		"ratingCount": [
			{
				"type": [
					"http://schema.org/AggregateRating"
				],
				"properties": {
					"count": [
						3
					],
					"authors": [
						{
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
								      536017463
								    ],
								    "name": [
								      "Nahuel García Ocampo"
								    ]
								  }
								}
							]
						},
						{
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
								      1002769970
								    ],
								    "name": [
								      "Luis Suas"
								    ]
								  }
								}
							]
						},
						{
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
								      1060147124
								    ],
								    "name": [
								      "Sol Laborde"
								    ]
								  }
								}
							]
						}
					]
				}
			}
		],
		"userComments":[
			{
				"type": [
					"http://schema.org/UserComments"
				],
				"properties": {
					[
						{
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
								      1265409676
								    ],
								    "name": [
								      "Facu Vivas"
								    ]
								  }
								}
							],
							"text": [
								"ser o no ser? jaja"
							]
						},
						{
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
								      600129837
								    ],
								    "name": [
								      "Conrado Mader Blanco"
								    ]
								  }
								}
							],
							"text": [
								"che vos sabes mucha Inglé no?"
							]
						}
					]
				}	
			}
		] 
	}
}
  """




