class BookApprovalsController < ApplicationController
  before_action :set_book_approval, only: [:show, :edit, :update, :destroy]

  def approve
    require 'date'
    @book_approval = BookApproval.find(params[:id])
    if @book_approval and @book_approval.approval_status == false
      if CheckOut.where(student_id: @book_approval.student_id).count < Student.find(@book_approval.student_id).maxborrowbooks and Book.find(@book_approval.book_id).count > 0
        create_book_history @book_approval.student_id, @book_approval.book_id, Date.today
        create_check_out @book_approval.library_id, @book_approval.student_id, @book_approval.book_id
        create_owe_money @book_approval.library_id, @book_approval.student_id, @book_approval.book_id, Date.today
        @book_approval.destroy
        @book = Book.find(@book_approval.book_id)
        @book.count = @book.count-1
        @book.save!
        redirect_to book_approvals_url, notice: 'Succeed! You approved this requirement and this book was checked out.'
      elsif CheckOut.where(student_id: @book_approval.student_id).count >= Student.find(@book_approval.student_id).maxborrowbooks
        @book_approval.approval_status = true
        @book_approval.save!
        redirect_to book_approvals_url, notice: 'Succeed! You approved this requirement, but the student borrowed too many books to check out this one.'
      else
        @book_approval.approval_status = true
        @book_approval.save!
        redirect_to book_approvals_url, notice: 'Succeed! You approved this requirement, but this book run out of copy now.'
      end
    elsif @book_approval and @book_approval.approval_status == true
      redirect_to book_approvals_url, notice: 'Fail! You have approved this requirement.'
    end
  end

  def disapprove
    if BookApproval.find(params[:id])
      @book_approval = BookApproval.find(params[:id])
      @book_approval.destroy
      redirect_to book_sprivals_url, notice: 'Succeed! You disapproved this requirement.'
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

  def create_owe_money(library_id, student_id, book_id, borrow_date)
    @owe_money = OweMoney.new
    @owe_money.library_id = library_id
    @owe_money.student_id = student_id
    @owe_money.book_id = book_id
    @owe_money.overdue_fine = 0
    @owe_money.borrow_date = borrow_date
    @owe_money.save!
  end

  # GET /book_approvals
  # GET /book_approvals.json
  def index
    @book_approvals = BookApproval.all
  end

  # GET /book_approvals/1
  # GET /book_approvals/1.json
  def show
  end

  # GET /book_approvals/new
  def new
    @book_approval = BookApproval.new
  end

  # GET /book_approvals/1/edit
  def edit
  end

  # POST /book_approvals
  # POST /book_approvals.json
  def create
    @book_approval = BookApproval.new(book_approval_params)

    respond_to do |format|
      if @book_approval.save
        format.html { redirect_to @book_approval, notice: 'Book approval was successfully created.' }
        format.json { render :show, status: :created, location: @book_approval }
      else
        format.html { render :new }
        format.json { render json: @book_approval.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_approvals/1
  # PATCH/PUT /book_approvals/1.json
  def update
    respond_to do |format|
      if @book_approval.update(book_approval_params)
        format.html { redirect_to @book_approval, notice: 'Book approval was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_approval }
      else
        format.html { render :edit }
        format.json { render json: @book_approval.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_approvals/1
  # DELETE /book_approvals/1.json
  def destroy
    @book_approval.destroy
    respond_to do |format|
      format.html { redirect_to book_approvals_url, notice: 'Book approval was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_approval
      @book_approval = BookApproval.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_approval_params
      params.fetch(:book_approval, {})
    end
end
