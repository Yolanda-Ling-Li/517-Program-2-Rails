## CSC/ECE 517 - Object Oriented Design and Development
# Program 2 - Ruby on Rails

* Teams may consist of 2-3 members
* Submission due date : September 30, 2019 (Monday) 11:59 PM
* Resubmission due date : October 9, 2019 (Wednesday) 11:59 PM

# Library Management 

Deployed application is built in AWS:
http://52.87.248.149:3000/

Preconfigured admin account and passwrod:
* Account: 111111@111.com
* Password: 111111

##Admin
The system have a preconfigured admin with the following attributes: 
* Email
* Password

Admin could be able to:
* In the home page, admin could log in with an email and password.
* After login, click View all students, admin could view the list of students, view their profile details (except password), modify their accounts and delete student from system.
* Click view all books, admin could view the list of books.
* There is a row of buttons under the books list, admin could create books, view the list of students with books overdue (along with overdue fines) and view the list of book hold requests.
* There is some buttons after each book information, admin could view detailed information of every book, delete book from system and view the borrowing history of each book.
* Click view all libraries and click show after one library, there is a Library Check Out List button under the library's information, admin could view that library's list of checked out books.
* Click admin logout, admin could exit system.                                                         

## Librarian

A librarian have following attributes: 
* Email (unique for each account)
* Password

Librarian could be able to:
* In the home page, librarian could log in with email and password.
* Click view all libraries and click edit after one library, librarian could edit library attributes by click destroy after library.
* Click view all books, librarian could add books to a library through button "New Book", and remove books from a library by click "Destroy" after one library.
* Click edit and history after one book, admin could view & edit book information, and view the borrowing history of the books.
* There is a row of buttons under the books list, librarian could view the list of students with books overdue (along with overdue fines) and view the list of book hold requests.
* Click view all libraries and click show after one library, there is a Library Check Out List button under the library's information, librarian could view list of all the books that are checked out.
* Click librarian logout, librarian could exit system.   


## Students

A student should have the following attributes: 
* Email (unique for each account), 
* Name 
* Password
* University
* Maximum number of books (**N**) that can be borrowed at any given time.

Student could be able to:
* Click view all libraries, student could view the list of all the libraries
* Click view all books, student could view all books
* Click Borrow and Return button after each book, student could Check out/Return a book from any library.
* If student click Borrow button of a book which has been borrowed, he/she will get tips and choose to request for the book or not.
* Click Hold Request button under the book list and click destroy after each hold request, student could delete a reservation.
* Click Edit Profile, student could view/edit their account attributes (including changing their password).
* student could search through the books in Search Now field.
  * Search by title
  * Search by author
  * Search by publication date
  * Search by category
* Click Bookmark button after each book, student could bookmark a book they are interested in, and click twice will cancel bookmark.
* Click Bookmarked List in the top, student can view their bookmarked books.
* Click Owe Money button under the book list, student could view the overdue fines for his/her account. 
* Click student logout, student could exit system.   

##Details:
* When a library is deleted, any list or items relate to this library will be deleted, so does book. In other words, when you delete a library, you are deleting all books and records according to this library, and when you destroy a book, you are destroying every records relate to this book.
