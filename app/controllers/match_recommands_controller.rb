#coding: utf-8
#比赛推荐
class MatchRecommandsController < ApplicationController
  before_action :set_match_recommand, only: [:show, :edit, :update, :destroy]

  # GET /match_recommands
  # GET /match_recommands.json
  def index
    @q = MatchRecommand.unread(params[:data_time]).ransack(params[:q])
    @match_recommands = @q.result
  end
  # GET /match_recommands/report
  # GET /match_recommands/report.json
  # 推荐胜负统计
  def report
    if params[:data_time_eq].blank?
      params[:data_time_eq] = 1.days.ago.strftime("%Y-%m-%d")
    end
    @q = MatchRecommand.where("TO_CHAR(data_time,'YYYY-MM-DD') = ? ",params[:data_time_eq]).ransack(params[:q])
    @yinglang_match_recommands = @q.result.where("result_type IS NOT NULL").where(recommend_type: 2)
    @success_yinglang_match_recommands = @q.result.where("result_type > 0").where(recommend_type: 2)
    @bigdata_match_recommands = @q.result.where("result_type IS NOT NULL").where(recommend_type: 1)
    @success_bigdata_match_recommands = @q.result.where("result_type > 0").where(recommend_type: 1)
  end

  # GET /match_recommands/1
  # GET /match_recommands/1.json
  def show
  end

  # GET /match_recommands/new
  def new
    @match_recommand = MatchRecommand.new
  end

  # GET /match_recommands/1/edit
  def edit
  end

  # POST /match_recommands
  # POST /match_recommands.json
  def create
    @match_recommand = MatchRecommand.new(match_recommand_params)

    respond_to do |format|
      if @match_recommand.save
        format.html { redirect_to @match_recommand, notice: 'Match recommand was successfully created.' }
        format.json { render :show, status: :created, location: @match_recommand }
      else
        format.html { render :new }
        format.json { render json: @match_recommand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /match_recommands/1
  # PATCH/PUT /match_recommands/1.json
  def update
    respond_to do |format|
      if @match_recommand.update(match_recommand_params)
        format.html { redirect_to @match_recommand, notice: 'Match recommand was successfully updated.' }
        format.json { render :show, status: :ok, location: @match_recommand }
      else
        format.html { render :edit }
        format.json { render json: @match_recommand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /match_recommands/1
  # DELETE /match_recommands/1.json
  def destroy
    @match_recommand.destroy
    respond_to do |format|
      format.html { redirect_to match_recommands_url, notice: 'Match recommand was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match_recommand
      @match_recommand = MatchRecommand.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_recommand_params
      params.require(:match_recommand).permit!
    end
end
