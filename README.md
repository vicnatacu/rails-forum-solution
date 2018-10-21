# README

## Description of application
This is a simple question/answer forum application that we could use for questions and answers for our class. It uses bootstrap for some minimal styling and modals.

In this weeks challenges, you will make changes to this application to complete the implementation and enhance it. 

## Setup
1. Run **bundle install** to install required gems
2. Update the config/database.yml to specify your Postgresql configuration information
3. Run **rails db:setup**
4. Run **rails db:migrate**
5. Start the rails server (**rails s**)
6. Verify you can see the application up and running
7. Verify you can see the forum databases created in your postgresql instance in pgadmin4

## Check it out
The buttons are connected to pages and forms, but there are no models created or populated yet for questions and answers, so all you see is dummy data.

## Challege #1
**Add a questions model to the application**

### Part 1: Add a question model, populate it with some initial data, and modify the controller and view to display that data
In this challenge, you will perform the necessary steps to add the question and answer models.

1. Use the **resource** generator to generate these models. 

The question model should have 2 fields:
* email: string
* body: text

The answer model should have 2 fields:
* email: string
* body: text

Remember to run **rails db:migrate** after generating these resources.

2.  Use the rails console (**rails c**) to add two questions to the questions table. Use commands in rails console to verify there is now two rows of data in the questions table.

3. In home/index.html.erb, you will see that fake data is shown right now. Before you modify home/index.html.erb to display real questions from the database, you need to modify the home controller to prepare that data. Remember, the job of the view is only to display data that is prepared by the controller.<br><br>
Modify the home controller index method to retrieve the questions currently stored in the database. (HINT: This modification should create a @questions instance variable that will be used by question/index.html.erb to display the real data.)

4. In home/index.html.erb, use the @questions instance variable to show questions from the database on the home page, instead of the fake data currently shown. (HINT: You will use a loop to iterate through the @questions variable, printing the appropriate fields for each question.)

5. There is a cool service we are using here to show the gravatar for an email address. Currently the gravatar URL is hardcoded, but we can change this to get the gravatar for a given email address. The first step, though, is to make our model provide the gravatar for us. <br><br>

Add a method to the Question ActiveRecord class (models/question.rb) called gravatar. In this method, just add a single line to create an MD5 hash of the email address and return a url with that hash:<br>
"http://www.gravatar.com/avatar/#{Digest::MD5.hexidigest(email)}" <br><br>

Now refer to this newly created gravatar method on the instance of question in home/index.html.erb instead of using the hardcoded URL.

6. Add another question from rails console using a different email address to see your gravatar method working!

###Part 2: Some enhancements - order questions by most recent and show age
After adding a new question, you'll notice that the most recent question is shown last on our home page, and that isn't ideal. Change the home page to show the most recent question asked first.
1. The appropriate place to do this is the home controller, because remember the controller is responsible for providing the data in the way we want it for the view. In the index method, you can make a small change to specify the order of the questions in the result set returned by the query on the database. Look up the syntax for the order method on ActiveRecord using google. Notice that only the field on which you want to order the result is required as an argument. However, the default order is ascending, and we want a descending order on the created_at column, so you will have to specify both the field and the order (created_at: :desc).
