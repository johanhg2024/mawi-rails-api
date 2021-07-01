# mawi-rails-api

mawi-rails-api is a small api to handle questions & answers for existing users.

### Technolgies

You'll need the following installed in your machine to run the api:

- Ruby 2.7 or greater
- Rails 6.1 or greater
- SQLite3

### Setup

After installing the respective frameworks in our machine, we do the following:

First, we go into the root folder:

```sh
cd mawi-rails-api
```


Then we install all gem dependencies:

```sh
bundle install
```


And after that, we run the necessary commands for setting up our database information:

```sh
rails db:create
rails db:migrate
rails db:seed
```

After that we can start our server:

```sh
rails s
```


We can check our server is running by going to http://localhost:3000/ in our respective browsers.


### Endpoints
Our current API hosts three endpoinst `/questions`, `/answers` & `/users`.

For `/questions` we have the following HTTP methods:

####POST
Creates a new question using the following JSON body:

```json
	{
	    "label": "Question label",
	    "active": true
	}
```

All fields are required.

Creates a new answer using the following JSON body and make sure that <user_id> and <question_id> exists in the database.

```json
	{
	    "answer": "answer test",
        "user_id": 1,
        "question_id": 2
	}
```

All fields are required.

####GET 
Get any answer using the following endpoint.
```
http://localhost:3000/api/v1/answers
```

And you can filter using the following attributes
```
http://localhost:3000/api/v1/answers?question_id=9
http://localhost:3000/api/v1/answers?label=qui
http://localhost:3000/api/v1/answers?active=true
http://localhost:3000/api/v1/answers?active=false

http://localhost:3000/api/v1/answers?user_id=2
http://localhost:3000/api/v1/answers?name=Minda
http://localhost:3000/api/v1/answers?email=abram@kreiger.name

http://localhost:3000/api/v1/answers?answer_id=2
http://localhost:3000/api/v1/answers?answer=atque
```