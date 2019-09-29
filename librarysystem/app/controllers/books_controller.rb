class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def borrow
    require 'date'
    @book=Book.find(params[:id])
    borrow_sate = true
    if @book.borrow_date
      borrow_sate = false
    end
    @book.borrow_date = Date.today
    if borrow_sate and @book.save!
      create_book_history session[:user_id], params[:id],Date.today
      render :borrow, status: :ok, location: @book
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
    @book.borrow_date=nil
    if return_sate && @book.save!
      render :return, status: :ok, location: @book
    else
      redirect_to books_url, notice: 'Fail! Book has been returned.'
    end
  end

  def create_book_history(user_id, book_id, borrow_date)
    @book_history = BookHistory.new
    @book_history.user_id = user_id
    @book_history.book_id = book_id
    @book_history.borrow_date = borrow_date
    @book_history.save!
  end

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
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
      params.require(:book).permit(:isbn, :title, :authors, :language, :published, :edition, :front_cover, :subject, :summary, :special, :library_id, :borrow_date)
    end
end
