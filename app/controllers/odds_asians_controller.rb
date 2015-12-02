class OddsAsiansController < ApplicationController
  before_action :set_odds_asian, only: [:show, :edit, :update, :destroy]

  # GET /odds_asians
  # GET /odds_asians.json
  def index
    @odds_asians = OddsAsian.all
  end

  # GET /odds_asians/1
  # GET /odds_asians/1.json
  def show
  end

  # GET /odds_asians/new
  def new
    @odds_asian = OddsAsian.new
  end

  # GET /odds_asians/1/edit
  def edit
  end

  # POST /odds_asians
  # POST /odds_asians.json
  def create
    @odds_asian = OddsAsian.new(odds_asian_params)

    respond_to do |format|
      if @odds_asian.save
        format.html { redirect_to @odds_asian, notice: 'Odds asian was successfully created.' }
        format.json { render :show, status: :created, location: @odds_asian }
      else
        format.html { render :new }
        format.json { render json: @odds_asian.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /odds_asians/1
  # PATCH/PUT /odds_asians/1.json
  def update
    respond_to do |format|
      if @odds_asian.update(odds_asian_params)
        format.html { redirect_to @odds_asian, notice: 'Odds asian was successfully updated.' }
        format.json { render :show, status: :ok, location: @odds_asian }
      else
        format.html { render :edit }
        format.json { render json: @odds_asian.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /odds_asians/1
  # DELETE /odds_asians/1.json
  def destroy
    @odds_asian.destroy
    respond_to do |format|
      format.html { redirect_to odds_asians_url, notice: 'Odds asian was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_odds_asian
      @odds_asian = OddsAsian.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def odds_asian_params
      params[:odds_asian]
    end
end
