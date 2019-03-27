require 'uri'
require 'net/http'
require 'openssl'


url = URI("https://yoursubdomain.zendesk.com/api/v2/users.json")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Post.new(url)
request["content-type"] = 'application/json'
request["authorization"] = 'xxxxxxxxxxx '
request.body = "{\n\"user\": \n\t{\n\t\t\"name\": \"U3\", \n\t\t\"email\": \"U3@example.org\"\n\t}\n}\n"

response = http.request(request)
puts response.read_body