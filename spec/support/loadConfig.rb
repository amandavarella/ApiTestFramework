require 'yaml'

def load_config
  path = '../../config/config.yml'
  YAML::load(File.open(path))
end

def account_url
  yml = load_config
  yml['account']['url']
end

def environment
  yml = load_config
  yml['account']['env']
end

def username
  yml = load_config
  yml['account']['username']
end

def password
  yml = load_config
  yml['account']['password']
end

def basic_auth
  yml = load_config
  yml['account']['auth']
end