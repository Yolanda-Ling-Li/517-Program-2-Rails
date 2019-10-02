class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def borrow
    require 'date'
    @book=Book.find(params[:id])
    borrow_sate = true
    if @book.borrow_date
      borrow_sate = false
    end
    this_student = false
    if CheckOut.find_by(:student_id => current_student.id, :book_id => @book.id)
      this_student = true
    end
    @book.borrow_date = Date.today
    if borrow_sate and @book.save!
      create_book_history current_student.id, params[:id], Date.today
      create_check_out Book.find(params[:id]).library_id, current_student.id, params[:id]
      create_owe_money Book.find(params[:id]).library_id, current_student.id, params[:id], Date.today
      render :borrow, status: :ok, location: @book
    elsif this_student
      redirect_to books_url, notice: 'Fail! You have borrowed this book.'
    else
      redirect_to books_url, notice: 'Fail! Book has been borrowed by others.'
    end
  end

  def return
    @book=Book.find(params[:id])
    return_sate = true
    if !(@book.borrow_date)
      return_sate = false
    end
    this_student = false
    if CheckOut.find_by(:student_id => current_student.id, :book_id => @book.id)
      this_student = true
    end

    @book.borrow_date=nil
    if return_sate && this_student && @book.save!
      destroy_check_out Book.find(params[:id]).library_id, current_student.id, params[:id]
      update_owe_money Book.find(params[:id]).library_id, current_student.id, params[:id]
      render :return, status: :ok, location: @book
    elsif !(return_sate)
      redirect_to books_url, notice: 'Fail! Book has been returned.'
    elsif !(this_student)
      redirect_to books_url, notice: 'Fail! Book is borrowed by others.'
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
      redirect_to books_url, notice: 'Succeed! Book has been unbookmarked by you.'
    else
      @bookmark = Bookmark.new
      @bookmark.student_id = current_student.id
      @bookmark.book_id = params[:id]
      if @bookmark.save!
        render :bookmark, status: :ok, location: @book
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

  # GET /books
  # GET /books.json
  def index
    OweMoney.find_each do |owemoney|
      require 'Date'
      if owemoney.borrow_date != nil
        owe_library = Library.find(owemoney.library_id)
        owemoney.overdue_fine = ((owemoney.borrow_date - Date.today).to_i - owe_library.maxborrowdays + 1) * owe_library.overduefine
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
      params.require(:book).permit(:isbn, :title, :authors, :language, :published, :edition, :front_cover, :subject, :summary, :special, :library_id, :borrow_date,:term)
    end
end
