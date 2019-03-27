# ApiTestFramework
Documentation for API test framework workshop for women who test meetup

# STEP 1

1. Create a new project in your IDE or use any online ruby compliler like Repl.

2. Create folders as follows
	- config
	- spec
	   - features
		 - fixtures
		 - support	
3. Create new file
 	- Features -> original_test.rb
	
4. Copy code snippet from postman to original_test.rb

5. Following lines of code are required to run postman test in ruby. Please add them if its missing.

	`require 'openssl'`
	
	`http.use_ssl = true`
	
6. To remove postman specific settings and tokens delete follwoing code from your test as they are NO longer required

	`request["postman-token"] = token_vale`
	
	`request["cache-control"] = 'no-cache'	`
	
7. Run test from the project path

	If using terminal to run test 

	```
	cd spec/features
	ruby original_test.rb
	```
	
	` !!! Test Should pass !!! `
	
Note : if test fails with error `email is already being used by another user` please change user email address and rerun the test case	


# STEP 2

1. Create a duplicate copy of  `original_test.rb` and name it as `refactor_test.rb`
	
	`refactor_test.rb` will be now used to refactor the test code and can be later compared with original_test.rb

2. Follow presenter instructions to add explanation/documentation to your test 

3. Create new files under follwing folders

	config -> 
		config.rb
	
	Fixtures -> 
		endpoints.rb
	
	Support ->
		configClient.rb,	 
		helper.rb, 	
		loadConfig.rb
		
4. Modify `refactor_test.rb` to import all required files

	```
	require 'json'
	require '../../spec/support/loadConfig'
	require '../../spec/fixtures/endpoints'
	require '../../spec/support/helper'
	require '../../spec/support/configClient'
	```
	
	Note : if require doesn’t work try require_relative

4. Modify `refactor_test.rb` to add assertions as follows

	```
	# assert if response code is not 201
	if response.code != '201'
	  raise "Invalid response code"
	end
	
	```
5. Run `refactor_test.rb` 

`!!! Test will fail with error : email is already being used by another user !!!`

So now its time to create some test data


# STEP 3

1. To create test data copy following methods in `support->helper.rb`

	```
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

	```

2. Modify `refactor_test.rb` to use the test data by modifying the request body as follows

	```
	# set the request body
	request.body = "{\t\n\"user\": \n\t{\n\t\t\"name\": \"#{create_user_name}\", \n\t\t\"email\": \"#
	{create_user_email}\"\n\t}\n}"
	
	```
3. Run `refactor_test.rb`

	` !!! Test Should be successful !!!`
	
# STEP 4

1. To set up account configuration copy the following code into `config -> config.yml`

	```
	account:
	 url: 'subdomain url'
	 env: 'Test'	
	```

2. For simplicity define domain url and endpoints separately in `refactor_test.rb`
	
	```
	domain_url = "https://z3n-wwt.zendesk.com"
	endpoint = "/api/v2/users.json"
	
	url = URI(domain_url + endpoint)
	
	```
3. Add subdomain information in `config.yml`

	``` 
	account:
	   url: 'https://z3n-wwt.zendesk.com'
	   
	 ```
4. Define API endpoint in `endpoints.rb`

	` CREATE_USER = "/api/v2/users.json" `
	
	
5. Run `refactor_test.rb`

	` !!! Test Should be successful !!!`	
	
	
# STEP 5

1. To load the account information add following methods to `support->loadConfig.rb`

```
	require 'yaml'
	
	def load_config
	 path = '../../config/config.yml'
	 YAML::load(File.open(path))
	end

	def account_url
	 yml = load_config
	 yml['account']['url']
	end
	
	def envirionment
	 yml = load_config
	 yml['account']['env']
	end 
```

2. use above methods in `refactor_test.rb`to make sure correct values of subdomain and endpoints are loaded

Mofidy `refactor_test.rb` 

```
puts account_url
puts CREATE_USER

```

3. Run `refactor_test.rb`

	`!!! test should print values present in config.yml !!!`
	
	
	
	
