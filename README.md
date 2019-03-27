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




