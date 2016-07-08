1. Must use an Angular Front-End that includes at least 5 pages
  - Sign in page, sign up page, profile page, measurements pages, food pages.
2. Must contain some sort of nested views.
  - Profile/measurements, profile/food?
3. Must contain some sort of searching as well as filtering based on some criteria. Ex: All items in the "fruit" category, or all tasks past due
  - Search for food consumed on a specific day, autocomplete for previous entries of food, search for measurements of a specific type / or show page for that.
4. Must contain at least one page that allows for dynamic updating of a single field of a resource. Ex: Allow changing of quantity in a shopping cart
  - Allow users to update information regarding nutritional info of a food when viewing it.
5. Links should work correctly. Ex: Clicking on a product in a list, should take you to the show page for that product
  - Have show pages for measurements and food on a specific day.
6. Data should be validated in Angular before submission
  - Validate password length, data, food/measurement input as numbers, etc.
7. Must talk to the Rails backend using $http and Services.
  - Like the requirement says, pretty much. Create services that use $http to make POST/GET/PUT/DELETE requests.
8. Backend created with JSON that accepts and stores the data for Angular
  - Like the requirement says, pretty much. Controllers should create objects after receiving $http requests.



Project Planning:


1. User Authentication (complete).

  1. Create log object and associate with User upon sign up (complete).

2. Log Show Page (in progress).

  1. JSON request to backend API for log object (in progress).

  2. Link to current chapter if existent or otherwise link to create a new chapter (in progress).

  3. Link to chapters index.

  4. List statistical information regarding:

    1. Average weekly weight changes since first entry to last entry.

    2. Average weekly weight changes during chapters with a goal to maintain weight.

    3. Average weekly weight changes during chapters with a goal to gain weight.

    4. Average weekly weight changes during chapters with a goal to lose weight.

    5. Total weight change since first entry to last entry.

    6. Total time elapsed.

3. Chapter New Page.

  1. Create Chapter model and unit tests.

    1. Database columns: goal (float/string?), title(string), description(text), log_id(int), created_at/start_date (date), end_date (date, default: null)

  2. Create Chapter controller and #new/#create controller tests.

  3. Create a view page via Angular to handle Chapter creation with the following options:

    1. Goal: gain weight, lose weight, or maintain? Maybe a tick box, where users can go into negatives, zero, or positive, and text changes to reflect that.

    2. Notes/Description: Anything you'd like to say?

    3. Title: What do you want to call this?

4. Chapter Show Page.

  1. Option to mark chapter as complete, fill in end date.

  2. Index of previous entries and their respective links.

  3. Link to today's entry show page.

  4. List statistical information regarding:

    1. Start of chapter.

    2. Time elapsed.

    3. Change in overall weight.

    4. Average weekly change in weight.

    5. Average deviation from goal.

    6. Total deviation from goal.

5. Entry Show Page / New Page.

  1. Create entry model and unit tests, controller#new action.

    1. Database columns: created_at/date (date), chapter_id(int), notes (description). Future plans: total calorie consumption (int), total protein consumption(int), total carb consumption(int), total fat consumption(int).

  2. Option to add/edit weight and other additional measurements.

    1. Database columns: entry_id(integer), weight(float), room for other measurements in the future.

  3. Future: Option to add food entry which can auto-fill in / balance nutrient to calorie information, also option to edit said food entries/delete.
