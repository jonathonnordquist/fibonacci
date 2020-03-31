Fibonicci
=========
Single page application which takes an input value and returns a fibonicci sequece of that length.

Setup and usage
---------------
Clone the repository and install using `bundle install`.  Launch by running `bundle exec rails server`.  Navigate to `http://localhost:3000/fibonacci/index`.

Enter any value into the text field and submit.  Negative, decimal and non-numeric values will return an error.

Specs are build in RSpec and Rubocop is available for linting.

Possible future improvements
----------------------------
* Styling to pretty up the page
* Front end validations
* Add a more powerful caching service using something like Redis.
* Add a database model to store generated values and allow the user to see previous results

Running as a basic Ruby application
-----------------------------------
Revert to commit 259cd0db9fe8bce793682cde40542b217044fe89.  This will uninstall all Rails components and revert the application to a commandline executable program which can be run by entering `ruby fibonacci.rb n`.  Input validations remain in effect.
