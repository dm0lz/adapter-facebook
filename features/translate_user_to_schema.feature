Feature: Translate facebook to schema.org/Person/User + getfetcher.net/Item

  In order to send a standardized-properties form of the facebook information
  As a developer 
  I want to be able to convert from Facebook API to 
  schema.org based vocabulary

  Scenario: Converting a json facebook user into a json schema
  Given the facebook user:

  """
  {
    "name": "Tomás Mehdi", 
    "id": "735576666"
  }

  """

  When I convert it into schema.org/Person/User
  Then I should have user:

  """ 
{
  "type": [
    "http://schema.org/Person/User"
    ],
  "properties": {  
    "additionalType": [
      "http://getfetcher.net/Item"
    ],
    "http://getfetcher.net/Item#id": [
      "735576666"
    ],
    "name": [
      "Tomás Mehdi"
    ]
  }
}

  """



