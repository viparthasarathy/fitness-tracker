# Fitness Tracker
  This Angular single page application allows users store and track fitness related information. Users can create an account through a Devise-based authentication system and proceed to create chapters in their fitness log, set goals, and jot down daily information regarding their food intake and physical measurements. Users then receive statistical information regarding their average performance and progress in the context of a chapter and in the context of their log as a whole. The front-end of this application uses Angular in order to make requests to the server back-end, render information on the user's browser, and handle client-side validation of user input. The back-end of this application utilizes the Ruby on Rails framework to handle interactions with the database, server-side validation, and user authentication and authorization. The front-end of this application also uses the Bootstrap framework for styling purposes and borrows the Slate theme from Bootswatch. The project includes a test suite that employs RSpec, FactoryGirl, and Capybara for model and controller testing. 

## Host on Local Environment
Clone this directory to your local environment and execute:
```
 $ bundle install

 $ rake db:migrate

 $ rails s
```

Afterwards, head over to your local server in the browser. You should be able to create an account, sign in, and start tracking fitness related information.

## Demo

You can see a demo of this project [here](https://my-fitness-log.herokuapp.com/) hosted via Heroku.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/viparthasarathy/fitness-tracker.


## Copyright and License

[MIT License.](https://github.com/viparthasarathy/fitness-tracker/blob/master/LICENSE.md) Copyright 2016 Vidul Parthasarathy.
