class OweMoneysController < ApplicationController
  before_action :set_owe_money, only: [:show, :edit, :update, :destroy]

  # GET /owe_moneys
  # GET /owe_moneys.json
  def index
    @owe_moneys = OweMoney.all
  end

  # GET /owe_moneys/1
  # GET /owe_moneys/1.json
  def show
  end

  # GET /owe_moneys/new
  def new
    @owe_money = OweMoney.new
  end

  # GET /owe_moneys/1/edit
  def edit
  end

  # POST /owe_moneys
  # POST /owe_moneys.json
  def create
    @owe_money = OweMoney.new(owe_money_params)

    respond_to do |format|
      if @owe_money.save
        format.html { redirect_to @owe_money, notice: 'Owe money was successfully created.' }
        format.json { render :show, status: :created, location: @owe_money }
      else
        format.html { render :new }
        format.json { render json: @owe_money.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /owe_moneys/1
  # PATCH/PUT /owe_moneys/1.json
  def update
    respond_to do |format|
      if @owe_money.update(owe_money_params)
        format.html { redirect_to @owe_money, notice: 'Owe money was successfully updated.' }
        format.json { render :show, status: :ok, location: @owe_money }
      else
        format.html { render :edit }
        format.json { render json: @owe_money.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /owe_moneys/1
  # DELETE /owe_moneys/1.json
  def destroy
    @owe_money.destroy
    respond_to do |format|
      format.html { redirect_to owe_moneys_url, notice: 'Owe money was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_owe_money
      @owe_money = OweMoney.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def owe_money_params
      params.require(:owe_money).permit(:overdue_fine)
    end
end
