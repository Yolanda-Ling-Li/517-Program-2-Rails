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

## Admin
The system have a preconfigured admin with the following attributes: 
* Email
* Password

Admin could be able to:
* In the home page, admin could log in with an email and password.
* Admin can edit profile.
* After login, click manage students and librarians, admin could view the list of students and librarians, view their profile details,and modify their accounts and delete student/librarian from system.
* Click view all books/libraries, admin could view the list of books and libraries.
* Click create library , the admin can create a new library.
* There is a row of buttons under the books list, admin could create books, view the list of students with books overdue (along with overdue fines) and view the list of book hold requests, checkout books list.
* There is some buttons after each book information, admin could view detailed information of every book, delete book from system and view the borrowing history of each book.
* Click view all libraries and click show after one library, there is a Library Check Out List button under the library's information, admin could view that library's list of checked out books.
* Can modify/create/edit book and library.
* Click admin logout, admin could exit system.     

## Librarian

A librarian have following attributes: 
* Email (unique for each account)
* Password

Librarian could be able to:
* In the home page, librarian could log in with email and password.
* After login, librarian can change own profile to choose existing library. Each librarian can only work for one library.
* Click view all libraries and click edit after one library, librarian could edit library attributes by click destroy after library.
* Click view all books, librarian could add books to a library through button "New Book", and remove books from a library by click "Destroy" after one library, and also can edit a book.
* View hold requests for any book in the library he/she works in.
* For books in the special collection, librarian can accept or deny book hold request.
* Click edit and history after one book, admin could view & edit book information, and view the borrowing history of the books.
* View the list of students with overdue books from their library along with overdue fine.
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
* Login with email and password with specific study level.
* Edit profile to modify email, name and password only.
* Click view all libraries, student could view the list of all the libraries
* Click view all books, student could view all books
* Check out/Request/Return a book from any library associated with their University.
* Delete a reservation request, which has not been approved yet (pending).
* Student can borrow a max of 'N' number of books based on their educational level.
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

## Bonus
* We finished the bonus1 that no one can access sepcial page without login.
* Emails are sent to accounts when triggered, be sure to register with your real email.


## Details:
* When a library is deleted, any list or items relate to this library will be deleted, so does book. In other words, when you delete a library, you are deleting all books and records according to this library, and when you destroy a book, you are destroying every records relate to this book.


