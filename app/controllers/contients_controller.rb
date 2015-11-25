class ContientsController < ApplicationController
  before_action :set_contient, only: [:show, :edit, :update, :destroy]

  # GET /contients
  # GET /contients.json
  def index
    @contients = Contient.all
  end

  # GET /contients/1
  # GET /contients/1.json
  def show
  end

  # GET /contients/new
  def new
    @contient = Contient.new
  end

  # GET /contients/1/edit
  def edit
  end

  # POST /contients
  # POST /contients.json
  def create
    @contient = Contient.new(contient_params)

    respond_to do |format|
      if @contient.save
        format.html { redirect_to @contient, notice: 'Contient was successfully created.' }
        format.json { render :show, status: :created, location: @contient }
      else
        format.html { render :new }
        format.json { render json: @contient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contients/1
  # PATCH/PUT /contients/1.json
  def update
    respond_to do |format|
      if @contient.update(contient_params)
        format.html { redirect_to @contient, notice: 'Contient was successfully updated.' }
        format.json { render :show, status: :ok, location: @contient }
      else
        format.html { render :edit }
        format.json { render json: @contient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contients/1
  # DELETE /contients/1.json
  def destroy
    @contient.destroy
    respond_to do |format|
      format.html { redirect_to contients_url, notice: 'Contient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contient
      @contient = Contient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contient_params
      params.require(:contient).permit(:continents_id, :cn_name, :en_name, :sort_value)
    end
end
