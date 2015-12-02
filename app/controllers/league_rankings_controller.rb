class LeagueRankingsController < ApplicationController
  before_action :set_league_ranking, only: [:show, :edit, :update, :destroy]

  # GET /league_rankings
  # GET /league_rankings.json
  def index
    @league_rankings = LeagueRanking.all
  end

  # GET /league_rankings/1
  # GET /league_rankings/1.json
  def show
  end

  # GET /league_rankings/new
  def new
    @league_ranking = LeagueRanking.new
  end

  # GET /league_rankings/1/edit
  def edit
  end

  # POST /league_rankings
  # POST /league_rankings.json
  def create
    @league_ranking = LeagueRanking.new(league_ranking_params)

    respond_to do |format|
      if @league_ranking.save
        format.html { redirect_to @league_ranking, notice: 'League ranking was successfully created.' }
        format.json { render :show, status: :created, location: @league_ranking }
      else
        format.html { render :new }
        format.json { render json: @league_ranking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /league_rankings/1
  # PATCH/PUT /league_rankings/1.json
  def update
    respond_to do |format|
      if @league_ranking.update(league_ranking_params)
        format.html { redirect_to @league_ranking, notice: 'League ranking was successfully updated.' }
        format.json { render :show, status: :ok, location: @league_ranking }
      else
        format.html { render :edit }
        format.json { render json: @league_ranking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /league_rankings/1
  # DELETE /league_rankings/1.json
  def destroy
    @league_ranking.destroy
    respond_to do |format|
      format.html { redirect_to league_rankings_url, notice: 'League ranking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_league_ranking
      @league_ranking = LeagueRanking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def league_ranking_params
      params[:league_ranking]
    end
end
