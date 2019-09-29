class StudentusersController < ApplicationController
  before_action :set_studentuser, only: [:show, :edit, :update, :destroy]

  # GET /studentusers
  # GET /studentusers.json
  def index
    @studentusers = Studentuser.all
  end

  # GET /studentusers/1
  # GET /studentusers/1.json
  def show
  end

  # GET /studentusers/new
  def new
    @studentuser = Studentuser.new
  end

  # GET /studentusers/1/edit
  def edit
  end

  # POST /studentusers
  # POST /studentusers.json
  def create
    @studentuser = Studentuser.new(studentuser_params)

    respond_to do |format|
      if @studentuser.save
        format.html { redirect_to @studentuser, notice: 'Studentuser was successfully created.' }
        format.json { render :show, status: :created, location: @studentuser }
      else
        format.html { render :new }
        format.json { render json: @studentuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /studentusers/1
  # PATCH/PUT /studentusers/1.json
  def update
    respond_to do |format|
      if @studentuser.update(studentuser_params)
        format.html { redirect_to @studentuser, notice: 'Studentuser was successfully updated.' }
        format.json { render :show, status: :ok, location: @studentuser }
      else
        format.html { render :edit }
        format.json { render json: @studentuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /studentusers/1
  # DELETE /studentusers/1.json
  def destroy
    @studentuser.destroy
    respond_to do |format|
      format.html { redirect_to studentusers_url, notice: 'Studentuser was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_studentuser
      @studentuser = Studentuser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def studentuser_params
      params.require(:studentuser).permit(:name, :email, :university, :maxborrowdays)
    end
end
