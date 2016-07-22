# Specifications for the Angular Assessment

Specs:
- [x] Use Angular to build the app - Using Angular.
- [x] Use ActiveRecord for storing information in a database: Using Angular $http to send requests to Rails backend. ActiveRecord interacts with the database to store info.
- [x] Include more than one model class (list of model class names): User, Log, Chapter, Entry, Food, Measurement (not fully implemented feature-side).
- [x] Include at least one has_many relationship (x has_many y): Log has many chapters, chapter has many entries, entries have many foods.
- [x] Include user accounts: Using Devise for user authentication.
- [x] Ensure that users can't modify content created by other users: Using Pundit for user authorization.
- [x] Include user input validations: Using Angular directives and HTML input types for validation.
- [x] Display validation failures to user with error message (example form URL): Using ngMessages to display validations.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code: See README.md.

Confirm
- [x] You have a large number of small Git commits: Currently 245 commits.
- [x] Your commit messages are meaningful: I try to keep them under 50 char and add descriptions when necessary.
- [x] You made the changes in a commit that relate to the commit message: Yes.
- [x] You don't include changes in a commit that aren't related to the commit message: Generally, unless it's whitespace/minor syntax errors.
