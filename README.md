This is an exercise from Newfire Global's Ruby training program.

Warnings:
No validation for uniqueness was made. Therefore, there might be repeated names for intances.


Technical specification
Task: Library
Estimated lead time: 1 week
General info: The task is to create an application that'll help us manage the basic needs of our Library. The library contains the next entities: Authors, Books, Readers, and Orders.
- Library app must have an ability to add each of the entity to itself
- Library app must be persisted, that’s why we must have the ability to store/load data from the library.
- Library must have the ability to show some custom statistics about the library processes.

Entities:

Author
1. Name - required, String, not empty
2. Biography - optional

Book
1. Title - required,  String, not empty
2. Author  - required, must be an instance of Author class.

Reader
1. Name, requirded, String, not empty
2. Email - required, String, not empty
3. City - required, String, not empty
4. Street - required, String, not empty
5. House - required, Integer, positive

Order
1. Book - required, must be an instance of Book class.
2. Reader must be an instance of Reader class
3. Date must be an instance of a Ruby Date class. The default date is today's date.

Tasks:
- All the data of the library can be to stored/loaded into some storage (YML, JSON etc
- When we instantiate Library Class, all the entities must be loaded from the file.
- The library must have the ability for the next statistics:
  1. Top Reader. A top reader is the one that takes the most number of
books. The quantity of returned top readers must be configurable. Default quantity is  1 reader.
  2. Most Popular Books. The most popular book is the book that was taken by READERS the most times. The quantity of returned most popular books must be configurable. Default quantity is 1 book.
  3. Number of Readers of the Most Popular Books. The number of readers that take one of the SOME_QUANTITY most popular books. By default, SOME_QUANTITY is 3
  * If a user takes, for example, both first most popular book and second most popular book, then we count him one time.
- The library must contain “seed” (root) file where you show how you use your library. The root file must contain:
  1. Library instantiation
  2. Creating of all basic Entities in several examples
  3. Adding at least one example of each entity to Library instance
  4. Call of the “store/save” method
  5. Call of all 3 statistics methods.

Code requirements met:
- Intentations and “pretty” view of a code
- Ruby version must be persisted into the root of directory
- All branches/commits/modules/classes/methods/variables/files should be named correctly
- Project must have a hierarchy. Don't put all files in the root of the project.

For discussion:
- Project must contain Gemfile/Gemfile.lock with installed Rubocop and Fasterer.
- Project must have zero number of error/warnings after lintering!
- Project must have Pull Request on Git repository opened
