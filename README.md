# One Month Rails

This is the Pinteresting sample application for
[*One Month Rails*](http://onemonthrails.com)

by [Mattan Griffel](http://mattangriffel.com)

Developer [Michael Devenport](https://twitter.com/WEBrip) ;-)

#You are welcome to clone this application and use it to learn Ruby on Rails for free

(NOTE1) * = if you deploy to Heroku repeat below step in your live env

(NOTE2) before pushing to your Github repository $ RAILS_ENV=production rake assets:precompile

Step 1 - after cloned to your local development environment
cd into pins

$ bundle install

Step 2 * $ rake db:migrate

Step 3
Initalize it in your own git repository

change its origin

$ git remote rm origin

$ git init

$ git add .

$ git commit -m "cloned pins"

then create a new repository at Github and follow instruction.

Step 4 *
create categories

$ rails c 

<code>></code> Category.connection

<code>></code> Category.create(name: "type-name-of-category")

repeat at will
exit with control D

Step 5
Create a .env file in the root directory, 
Set  environment variables

GMAIL_DOMAIN=gmail.com

GMAIL_USERNAME=your-email-name

GMAIL_PASSWORD=your-email-password

Step 6 
create an application.yml if you want to use Stripe to except credit card payments
Set Stripe environment variables (refer to Stripe doc's and google for help)

Step 7 *
Create an account at AWS S3 and if deploying to Heroku set config variables,
see Heroku doc's for instruction and OMR plus google it

Step 8
create a Procfile and add script (web: bundle exec rails s) without parenthesis

Step 9
start foreman in a seperate Teminal window $ control T

$ foreman start

start the Webrick server in Terminal window 1

$ rails s

create 2 users or more

create 2 pins to get things up and running

(NOTE3) the application will run an error on the first pin build but it will save to db,
navigate to create new pin again and create a second pin, all should be good to go.

The second pin after commit active record cycle is complete will render on the pins show page
along with a random pin (the first pin you created). 

Step 10 (optional) * see https://github.com/activeadmin/activeadmin

open Activeadmin interface go to http://localhost:3000/admin/login

Sign in, change default email and password and admin username 

Question are very welcome actually i encourage them and no question is silly or dumb. 

Please let me know if i have missed any steps or contact me anything else at http://www.youmix.me/contact

research how this works by googling plus see application.html.erb

Excuse the redundant css - refactor and change code at will

Plus sign up at [Youmix.me](http://www.youmix.me) and add tutorials
it's free, fun, and you'll be invoved with like minded people. Thats it Yay !

Enjoy this application and KEEP ON LEARNING ! Michael Devenport (student) 

ps: You will need to index the pins model to use the search function google 'searchkick' +
add this code to any form file for sound fx <code><%= render 'shared/form_audio' %></code> ;-)

I would personally like to thank OMR, MackenzieChild, and the awesome Michael Hartl 
for providing resourses i used to learn web development over 2015. Tars guys - - i love you too