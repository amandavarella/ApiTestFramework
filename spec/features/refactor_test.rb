# ********** import files ********
require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require '../../spec/support/loadConfig'
require '../../spec/fixtures/endpoints'
require '../../spec/support/helper'
require '../../spec/support/configClient'

# ***************** configure api client ************
api_client = configure_client

# ******** build a post request *************
request = build_post_request(CREATE_USER)

# ******* build request body ***********
request.body = "{\n\"user\": \n\t{\n\t\t\"name\": \"#{create_user_name}\", \n\t\t\"email\": \"#{create_user_email}\"\n\t}\n}\n"

# ********* Send request *********
response = api_client.request(request)

# ********* read the response *******
puts response.read_body

# assert if response code is not 201
if response.code != '201'
  raise "Invalid response code"
end