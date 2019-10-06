class HoldRequestsController < ApplicationController
  before_action :set_hold_request, only: [:show, :edit, :update, :destroy]

  # GET /hold_requests
  # GET /hold_requests.json
  def index
    @hold_requests = HoldRequest.all
  end

  # GET /hold_requests/1
  # GET /hold_requests/1.json
  def show
  end

  # GET /hold_requests/new
  def new
    @hold_request = HoldRequest.new
  end

  # GET /hold_requests/1/edit
  def edit
  end

  # POST /hold_requests
  # POST /hold_requests.json
  def create
    @hold_request = HoldRequest.new(hold_request_params)

    respond_to do |format|
      if @hold_request.save
        format.html { redirect_to @hold_request, notice: 'Hold request was successfully created.' }
        format.json { render :show, status: :created, location: @hold_request }
      else
        format.html { render :new }
        format.json { render json: @hold_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hold_requests/1
  # PATCH/PUT /hold_requests/1.json
  def update
    respond_to do |format|
      if @hold_request.update(hold_request_params)
        format.html { redirect_to @hold_request, notice: 'Hold request was successfully updated.' }
        format.json { render :show, status: :ok, location: @hold_request }
      else
        format.html { render :edit }
        format.json { render json: @hold_request.errors, status: :unprocessable_entity }
      end
    end
    # book_id = params[:hold_request][:book_id]
    # if HoldRequest.find_by(:book_id => book_id, :student_id => current_student.id) and !(Book.find_by(:book_id => book_id).borrow_date)
    #   @hold_request1 = HoldRequest.find(params[:id])
    #   @hold_request1.destroy
    #   @hold_request2 = HoldRequest.find_by(:book_id => book_id, :student_id => current_student.id)
    #   @hold_request2.destroy
    #   @book=Book.find(book_id)
    #   create_book_history @book.library_id, book_id, Date.today
    #   create_check_out @book.library_id, current_student.id, book_id
    #   create_owe_money @book.library_id, current_student.id, book_id, Date.today
    #   @book.borrow_date = Date.today
    #   @book.save!
    # elsif HoldRequest.find_by(:book_id => book_id, :student_id => current_student.id) and Book.find_by(:book_id => book_id).borrow_date
    #   @hold_request = HoldRequest.find(params[:id])
    #   @hold_request.destroy
    # elsif !(HoldRequest.find_by(:book_id => book_id, :student_id => current_student.id)) and !(Book.find_by(:book_id => book_id).borrow_date)
    #   @hold_request = HoldRequest.find(params[:id])
    #   @hold_request.destroy
    #   @book=Book.find(book_id)
    #   create_book_history @book.library_id, book_id, Date.today
    #   create_check_out @book.library_id, current_student.id, book_id
    #   create_owe_money @book.library_id, current_student.id, book_id, Date.today
    #   @book.borrow_date = Date.today
    #   @book.save!
    # else
    #   @hold_request = HoldRequest.new
    #   @hold_request.library_id = Book.find(book_id).library_id
    #   @hold_request.student_id = current_student.id
    #   @hold_request.save!
    # end
  end

  # DELETE /hold_requests/1
  # DELETE /hold_requests/1.json
  def destroy
    @hold_request.destroy
    respond_to do |format|
      format.html { redirect_to hold_requests_url, notice: 'Hold request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hold_request
      @hold_request = HoldRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hold_request_params
      params.fetch(:hold_request, {})
    end
end
