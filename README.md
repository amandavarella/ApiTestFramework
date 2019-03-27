# ApiTestFramework
Documentation for API test framework workshop for women who test meetup

# STEP 1

- Create a new project in your IDE or use any online ruby compliler like Repl.
- Create folders as follows
	- config
	- spec
	   - features
		 - fixtures
		 - support	
 - Create new file
 	- Features -> original_test.rb
- Copy code snippet from postman to original_test.rb
- Following lines of code are required to run postman test in ruby	
	`require 'openssl'`
	`http.use_ssl = true`
- To remove postman specific settings and tokens delete follwoing code from your test as they are NO longer required
	`request["postman-token"] = token_vale`
	`request["cache-control"] = 'no-cache'	
