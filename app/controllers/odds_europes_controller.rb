class OddsEuropesController < ApplicationController
  before_action :set_odds_europe, only: [:show, :edit, :update, :destroy]

  # GET /odds_europes
  # GET /odds_europes.json
  def index
    @odds_europes = OddsEurope.all
  end

  # GET /odds_europes/1
  # GET /odds_europes/1.json
  def show
  end

  # GET /odds_europes/new
  def new
    @odds_europe = OddsEurope.new
  end

  # GET /odds_europes/1/edit
  def edit
  end

  # POST /odds_europes
  # POST /odds_europes.json
  def create
    @odds_europe = OddsEurope.new(odds_europe_params)

    respond_to do |format|
      if @odds_europe.save
        format.html { redirect_to @odds_europe, notice: 'Odds europe was successfully created.' }
        format.json { render :show, status: :created, location: @odds_europe }
      else
        format.html { render :new }
        format.json { render json: @odds_europe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /odds_europes/1
  # PATCH/PUT /odds_europes/1.json
  def update
    respond_to do |format|
      if @odds_europe.update(odds_europe_params)
        format.html { redirect_to @odds_europe, notice: 'Odds europe was successfully updated.' }
        format.json { render :show, status: :ok, location: @odds_europe }
      else
        format.html { render :edit }
        format.json { render json: @odds_europe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /odds_europes/1
  # DELETE /odds_europes/1.json
  def destroy
    @odds_europe.destroy
    respond_to do |format|
      format.html { redirect_to odds_europes_url, notice: 'Odds europe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_odds_europe
      @odds_europe = OddsEurope.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def odds_europe_params
      params[:odds_europe]
    end
end
