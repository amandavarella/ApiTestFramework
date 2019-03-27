require 'net/http'

# This method configures and returns api client
def configure_client
  url = URI(account_url)
  # api client
  api_client = Net::HTTP.new(url.host, url.port)
  api_client.use_ssl = true
  api_client
end

def build_post_request(endpoint)
  url = account_url + endpoint

  # configure an API client
  request = Net::HTTP::Post.new(URI(url))
  request["content-type"] = 'application/x-www-form-urlencoded'
  request["authorization"] = basic_auth
  request["Content-Type"] = "application/json"
  request
end