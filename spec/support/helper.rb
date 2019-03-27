require 'securerandom'
require 'time'

def current_time
  Time.now.to_i
end

def create_user_name
  "user#{current_time}#{rand(100)}"
end

def create_user_email
  "user#{current_time}#{rand(100)}@example.com"
end