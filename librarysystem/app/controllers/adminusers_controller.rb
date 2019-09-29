class AdminusersController < ApplicationController
  before_action :set_adminuser, only: [:show, :edit, :update, :destroy]

  # GET /adminusers
  # GET /adminusers.json
  def index
    @adminusers = Adminuser.all
  end

  # GET /adminusers/1
  # GET /adminusers/1.json
  def show
  end

  # GET /adminusers/new
  def new
    @adminuser = Adminuser.new
  end

  # GET /adminusers/1/edit
  def edit
  end

  # POST /adminusers
  # POST /adminusers.json
  def create
    @adminuser = Adminuser.new(adminuser_params)

    respond_to do |format|
      if @adminuser.save
        format.html { redirect_to @adminuser, notice: 'Adminuser was successfully created.' }
        format.json { render :show, status: :created, location: @adminuser }
      else
        format.html { render :new }
        format.json { render json: @adminuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adminusers/1
  # PATCH/PUT /adminusers/1.json
  def update
    respond_to do |format|
      if @adminuser.update(adminuser_params)
        format.html { redirect_to @adminuser, notice: 'Adminuser was successfully updated.' }
        format.json { render :show, status: :ok, location: @adminuser }
      else
        format.html { render :edit }
        format.json { render json: @adminuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adminusers/1
  # DELETE /adminusers/1.json
  def destroy
    @adminuser.destroy
    respond_to do |format|
      format.html { redirect_to adminusers_url, notice: 'Adminuser was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adminuser
      @adminuser = Adminuser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adminuser_params
      params.require(:adminuser).permit(:email, :name, :password)
    end
end
