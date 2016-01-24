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

Step 2 *
$ rake db:migrate

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
> Category.connection
> Category.create(name: "type-name-of-category")
repeat at will
exit with control D

Step 5
start the Webrick server
$ rails s
create 2 pins to get things up and running
(NOTE3) the application will run an error on the first pin but it will save to db,
navagate to create new pin again and create a second pin, all should be good to go.

The second pin after commit record cycle is complete will render on the pins show page
along with a random pin (the first pin you created). Thats it Yay ! 

Enjoy this application and KEEP ON LEARNING ! Michael - i love you too

ps: Question are very welcome actually i encourage them and no question is silly or dumb. 






