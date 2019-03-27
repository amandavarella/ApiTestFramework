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
	
7. Run test from terminal from the project path

	```
	cd spec/features
	ruby original_test.rb
	```
	
	` !!! Test Should pass !!! `
	
Note : if test fails with error `email is already being used by another user` please change user email address and rerun the test case	
