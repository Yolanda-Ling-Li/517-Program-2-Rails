class LibrariansController < ApplicationController
    before_action :set_librarian, only: [:show, :edit, :update, :destroy]
  
    # GET /students
    # GET /students.json
    def index
      @librarians = Librarian.all
    end
  
    # GET /students/1
    # GET /students/1.json
    def show
    end
  
    # GET /students/new
    def new
      @librarian = Librarian.new
    end
  
    # GET /students/1/edit
    def edit
    end
  
    # POST /students
    # POST /students.json
    def create
      @librarian = Librarian.new(librarian_params)
  
      respond_to do |format|
        if @librarian.save
          format.html { redirect_to @librarian, notice: 'Librarian was successfully created.' }
          format.json { render :show, status: :created, location: @librarian }
        else
          format.html { render :new }
          format.json { render json: @librarian.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /students/1
    # PATCH/PUT /students/1.json
    def update
      respond_to do |format|
        if @librarian.update(librarian_params)
          format.html { redirect_to @librarian, notice: 'Librarian was successfully updated.' }
          format.json { render :show, status: :ok, location: @librarian }
        else
          format.html { render :edit }
          format.json { render json: @librarian.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /students/1
    # DELETE /students/1.json
    def destroy
      @librarian.destroy
      respond_to do |format|
        format.html { redirect_to librarians_url, notice: 'librarian was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_librarian
        @librarian = Librarian.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def librarian_params
        params.require(:librarian).permit(:name, :password, :email,:library_id)
      end
  end
  