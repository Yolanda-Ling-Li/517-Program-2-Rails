class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_all!

  def borrow
    require 'date'
    @book=Book.find(params[:id])
    borrow_status = false
    if @book.count > 0
      borrow_status = true
    end
    this_student = false
    if CheckOut.find_by(:student_id => current_student.id, :book_id => @book.id)
      this_student = true
    end
    @book.count = @book.count - 1

    if CheckOut.where(student_id: current_student.id).count >= current_student.maxborrowbooks
        redirect_to books_url, notice: 'Fail! The number of borrowed books has reached the upper limit.'
    elsif borrow_status and !(this_student) and @book.special != "Yes" and @book.save!
      create_book_history current_student.id, params[:id], Date.today
      create_check_out Book.find(params[:id]).library_id, current_student.id, params[:id]
      create_owe_money Book.find(params[:id]).library_id, current_student.id, params[:id], Date.today
      redirect_to check_outs_url, notice: 'Succeed! The book is in your check out list now.'
    elsif this_student
      redirect_to books_url, notice: 'Fail! You have borrowed this book.'
    elsif borrow_status and @book.special == "Yes"
      create_book_approval Book.find(params[:id]).library_id, current_student.id, params[:id]
      redirect_to books_url, notice: 'Succeed! But this book is special. Please wait to librarian approval to check out.'
    else
      render :hold_request, status: :ok, location: @book
      # redirect_to books_url, notice: 'Fail! Book has been borrowed by others.'
    end
  end

  def return
    @book=Book.find(params[:id])
    return_status =  false
    if CheckOut.find_by(:student_id => current_student.id, :book_id => @book.id)
      return_status = true
      @book.count = @book.count + 1
    end

    if return_status && @book.save!
      destroy_check_out Book.find(params[:id]).library_id, current_student.id, params[:id]
      update_owe_money Book.find(params[:id]).library_id, current_student.id, params[:id]
      update_hold_request params[:id]
      update_book_approval current_student.id
      redirect_to check_outs_url, notice: 'Succeed! The book is out of your check out list now.'
    elsif !(return_status)
      redirect_to books_url, notice: 'Fail! You did not borrow this book.'
    end
  end

  def create_book_history(student_id, book_id, borrow_date)
    @book_history = BookHistory.new
    @book_history.student_id = student_id
    @book_history.book_id = book_id
    @book_history.borrow_date = borrow_date
    @book_history.save!
  end

  def create_check_out(library_id, student_id, book_id)
    @check_out = CheckOut.new
    @check_out.library_id = library_id
    @check_out.student_id = student_id
    @check_out.book_id = book_id
    @check_out.save!
  end

  def destroy_check_out(library_id, student_id, book_id)
    @check_out = CheckOut.find_by(:library_id => library_id, :student_id => student_id, :book_id => book_id)
    @check_out.destroy
  end

  def bookmark
    if Bookmark.find_by(:student_id => current_student.id, :book_id => params[:id])
      @bookmark = Bookmark.find_by(:student_id => current_student.id, :book_id => params[:id])
      @bookmark.destroy
      redirect_to bookmarks_url, notice: 'Succeed! Book has been unbookmarked by you.'
    else
      @bookmark = Bookmark.new
      @bookmark.student_id = current_student.id
      @bookmark.book_id = params[:id]
      if @bookmark.save!
        redirect_to bookmarks_url, notice: 'Succeed! The book is in your bookmarked book list now.'
      end
    end
  end

  def create_owe_money(library_id, student_id, book_id, borrow_date)
    @owe_money = OweMoney.new
    @owe_money.library_id = library_id
    @owe_money.student_id = student_id
    @owe_money.book_id = book_id
    @owe_money.overdue_fine = 0
    @owe_money.borrow_date = borrow_date
    @owe_money.save!
  end

  def update_owe_money(library_id, student_id, book_id)
    @owe_money = OweMoney.find_by(:library_id => library_id, :student_id => student_id, :book_id => book_id)
    @owe_money.borrow_date = nil
    @owe_money.save!
  end

  def hold_request
    if HoldRequest.find_by(:library_id => Book.find(params[:id]).library_id, :student_id => current_student.id, :book_id => params[:id])
      redirect_to hold_requests_url, notice: 'Fail! You have already hold request for this book.'
    else
      @hold_request = HoldRequest.new
      @hold_request.library_id = Book.find(params[:id]).library_id
      @hold_request.student_id = current_student.id
      @hold_request.book_id = params[:id]
      @hold_request.save!
      redirect_to hold_requests_url, notice: 'Succeed! Book has been added in your hold request list.'
    end
  end

  def update_hold_request(book_id)
    require 'date'
    HoldRequest.where(:book_id => book_id).find_each do |hold_request|
      if hold_request and CheckOut.where(student_id: hold_request.student_id).count < Student.find(hold_request.student_id).maxborrowbooks
        @book=Book.find(book_id)
        create_book_history hold_request.student_id, book_id, Date.today
        create_check_out hold_request.library_id, hold_request.student_id, book_id
        create_owe_money hold_request.library_id, hold_request.student_id, book_id, Date.today
        @book.count = @book.count - 1
        hold_request.destroy
        @book.save!
        break
      end
    end
    HoldRequest.where(:student_id => current_student.id).find_each do |holdrequest|
      if Book.find(holdrequest.book_id).count > 0 and CheckOut.where(student_id: current_student.id).count < current_student.maxborrowbooks
        create_book_history holdrequest.student_id, holdrequest.book_id, Date.today
        create_check_out holdrequest.library_id, holdrequest.student_id, holdrequest.book_id
        create_owe_money holdrequest.library_id, holdrequest.student_id, holdrequest.book_id, Date.today
        @book = Book.find(holdrequest.book_id)
        @book.count = @book.count - 1
        @book.save!
        holdrequest.destroy
      end
    end
  end

  def create_book_approval(library_id, student_id, book_id)
    @book_approval = BookApproval.new
    @book_approval.library_id = library_id
    @book_approval.student_id = student_id
    @book_approval.book_id = book_id
    @book_approval.approval_status = false
    @book_approval.save!
  end

  def update_book_approval(student_id)
    BookApproval.where(:student_id => student_id).find_each do |book_approval|
      if book_approval and book_approval.approval_status == true and CheckOut.where(student_id: book_approval.student_id).count < Student.find(book_approval.student_id).maxborrowbooks
        create_book_history book_approval.student_id, book_approval.book_id, Date.today
        create_check_out book_approval.library_id, book_approval.student_id, book_approval.book_id
        create_owe_money book_approval.library_id, book_approval.student_id, book_approval.book_id, Date.today
        book_approval.destroy
        @book = Book.find(book_approval.book_id)
        @book.count = @book.count-1
        @book.save!
      end
    end
  end

  # GET /books
  # GET /books.json
  def index
    OweMoney.find_each do |owemoney|
      require 'date'
      if owemoney.borrow_date != nil
        owe_library = Library.find(owemoney.library_id)
        owemoney.overdue_fine = ((Date.today - owemoney.borrow_date).to_i - owe_library.maxborrowdays + 1) * owe_library.overduefine
        if owemoney.overdue_fine <0
        	owemoney.overdue_fine = 0
        end
        owemoney.save!
      end
    end
    @books = if params[:term]
      Book.where(['title LIKE ? OR authors LIKE ? OR published LIKE ? OR subject LIKE ?',"%#{params[:term]}%","%#{params[:term]}%","%#{params[:term]}%","%#{params[:term]}%"])
    else
    Book.all
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:isbn, :title, :authors, :language, :published, :edition, :front_cover, :subject, :summary, :special, :library_id, :count,:term)
    end
end
