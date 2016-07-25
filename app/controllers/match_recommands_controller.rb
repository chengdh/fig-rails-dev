#coding: utf-8
#比赛推荐
class MatchRecommandsController < ApplicationController
  before_action :set_match_recommand, only: [:show, :edit, :update, :destroy]

  # GET /match_recommands
  # GET /match_recommands.json
  def index
    @q = MatchRecommand.unread(params[:data_time]).ransack(params[:q])
    @match_recommands = @q.result

    @yinglang_match_recommands = @q.result.where("result_type IS NOT NULL").where(recommend_type: 2)
    @success_yinglang_match_recommands = @q.result.where("result_type > 0").where(recommend_type: 2)
    @bigdata_match_recommands = @q.result.where("result_type IS NOT NULL").where(recommend_type: 1)
    @success_bigdata_match_recommands = @q.result.where("result_type > 0").where(recommend_type: 1)
  end

  #GET /report_interface.json
  def report_interface
    @q = MatchRecommand.where("result_type IS NOT NULL").ransack(params[:q])
    @q_all = MatchRecommand.where("result_type IS NOT NULL").ransack
    @match_recommands = @q.result.paginate(page: params[:page], per_page: params[:per_page])

    @yinglang_match_recommands = @q.result.where(recommend_type: 2)
    @bigdata_match_recommands = @q.result.where(recommend_type: 1)
  end

  #最近胜场
  # GET /match_recommands/recent_win
  # GET /match_recommands/recent_win.json
  def recent_win
    @q = MatchRecommand.recent_win.ransack(params[:q])
    @match_recommands = @q.result
  end
  # GET /match_recommands/report
  # GET /match_recommands/report.json
  # 推荐胜负统计
  def report
    if params[:data_time_gte].blank?
      params[:data_time_gte] = 1.days.ago.strftime("%Y-%m-%d")
    end
    if params[:data_time_lte].blank?
      params[:data_time_lte] = 1.days.ago.strftime("%Y-%m-%d")
    end

    @q = MatchRecommand.where("TO_CHAR(t_match_recommend.data_time - 12/24,'YYYY-MM-DD') >= ? AND  TO_CHAR(t_match_recommend.data_time - 12/24,'YYYY-MM-DD') <= ? ",
                              params[:data_time_gte],params[:data_time_lte]).ransack(params[:q])
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
  # POST /match_recommands/create_temp
  # POST /match_recommands/create_temp.json
  def create_temp
    @match_recommend_temp = MatchRecommendTmp.new(match_recommend_temp_params)
    respond_to do |format|
      if @match_recommend_temp.save
        format.json { render json: @match_recommend_temp, status: :created, location: ""}
      else
        format.json { render json: @match_recommend_temp.errors, status: :unprocessable_entity }
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
    def match_recommend_temp_params
      params.require(:match_recommend_temp).permit(:match_id,:team_id,:recommend_type)
    end
end
