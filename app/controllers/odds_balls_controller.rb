#coding: utf-8
#大小球
class OddsBallsController < ApplicationController
  protect_from_forgery :except => :index
  before_action :set_odds_ball, only: [:show, :edit, :update, :destroy]

  # GET /odds_balls
  # GET /odds_balls.json
  def index
    @q = OddsBall.ransack(params[:q])
    @odds_balls = @q.result
    respond_to do |format|
      format.js {render :partial => "odds_ball"}
    end
  end

  # GET /odds_balls/1
  # GET /odds_balls/1.json
  def show
  end

  # GET /odds_balls/new
  def new
    @odds_ball = OddsBall.new
  end

  # GET /odds_balls/1/edit
  def edit
  end

  # POST /odds_balls
  # POST /odds_balls.json
  def create
    @odds_ball = OddsBall.new(odds_ball_params)

    respond_to do |format|
      if @odds_ball.save
        format.html { redirect_to @odds_ball, notice: 'Odds ball was successfully created.' }
        format.json { render :show, status: :created, location: @odds_ball }
      else
        format.html { render :new }
        format.json { render json: @odds_ball.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /odds_balls/1
  # PATCH/PUT /odds_balls/1.json
  def update
    respond_to do |format|
      if @odds_ball.update(odds_ball_params)
        format.html { redirect_to @odds_ball, notice: 'Odds ball was successfully updated.' }
        format.json { render :show, status: :ok, location: @odds_ball }
      else
        format.html { render :edit }
        format.json { render json: @odds_ball.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /odds_balls/1
  # DELETE /odds_balls/1.json
  def destroy
    @odds_ball.destroy
    respond_to do |format|
      format.html { redirect_to odds_balls_url, notice: 'Odds ball was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_odds_ball
      @odds_ball = OddsBall.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def odds_ball_params
      params[:odds_ball]
    end
end
