class CurrentMatchesController < ApplicationController
  before_action :set_current_match, only: [:show, :edit, :update, :destroy]

  # GET /current_matches
  # GET /current_matches.json
  def index
    @current_matches = CurrentMatch.all
  end

  # GET /current_matches/1
  # GET /current_matches/1.json
  def show
  end

  # GET /current_matches/new
  def new
    @current_match = CurrentMatch.new
  end

  # GET /current_matches/1/edit
  def edit
  end

  # POST /current_matches
  # POST /current_matches.json
  def create
    @current_match = CurrentMatch.new(current_match_params)

    respond_to do |format|
      if @current_match.save
        format.html { redirect_to @current_match, notice: 'Current match was successfully created.' }
        format.json { render :show, status: :created, location: @current_match }
      else
        format.html { render :new }
        format.json { render json: @current_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /current_matches/1
  # PATCH/PUT /current_matches/1.json
  def update
    respond_to do |format|
      if @current_match.update(current_match_params)
        format.html { redirect_to @current_match, notice: 'Current match was successfully updated.' }
        format.json { render :show, status: :ok, location: @current_match }
      else
        format.html { render :edit }
        format.json { render json: @current_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /current_matches/1
  # DELETE /current_matches/1.json
  def destroy
    @current_match.destroy
    respond_to do |format|
      format.html { redirect_to current_matches_url, notice: 'Current match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_current_match
      @current_match = CurrentMatch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def current_match_params
      params[:current_match]
    end
end
