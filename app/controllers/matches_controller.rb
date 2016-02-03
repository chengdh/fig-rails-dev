class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy,:show_bigdata]

  # GET /matches
  # GET /matches.json
  def index
    @matches = Match.all
  end

  #GET /matches/immediate
  #GET /matches/immediate.json
  def immediate
    @q = Match.immediate.ransack(params[:q])
    @matches = @q.result.paginate(page: params[:page], per_page: params[:per_page].present? ? params[:per_page] : 15)
  end

  #GET /matches/last_week
  #GET /matches/last_week.json
  #获取上周的比赛数据
  def last_week
    @current_day = params[:q].try(:[],:match_time_eq)
    @current_day = 1.days.ago.strftime("%Y-%m-%d") if @current_day.blank?
    @yesterday = (Date.strptime(@current_day,"%Y-%m-%d") - 1.days).strftime("%Y-%m-%d")
    @tomorrow = (Date.strptime(@current_day,"%Y-%m-%d") + 1.days).strftime("%Y-%m-%d")
    if params[:q].try(:[],:match_time_eq).blank?
      @q = Match.last_week.ransack(match_time_eq: @current_day)
    else
      @q = Match.last_week.ransack(params[:q])
    end
    @matches = @q.result
  end


  #GET /matches/this_week
  #GET /matches/this_week.json
  def this_week
    @current_day = params[:q].try(:[],:match_time_eq)
    @current_day = 1.days.since.strftime("%Y-%m-%d") if @current_day.blank?
    @yesterday = (Date.strptime(@current_day,"%Y-%m-%d") - 1.days).strftime("%Y-%m-%d")
    @tomorrow = (Date.strptime(@current_day,"%Y-%m-%d") + 1.days).strftime("%Y-%m-%d")
    if params[:q].try(:[],:match_time_eq).blank?
      @q = Match.last_week.ransack(match_time_eq: @current_day)
    else
      @q = Match.last_week.ransack(params[:q])
    end
    @matches = @q.result
  end

  #GET /matches/sb_list
  #GET /matches/sb_list.json
  #滚球界面
  def sb_list
    @q = Match.immediate.ransack(params[:q])
    @matches = @q.result.paginate(page: params[:page], per_page: params[:per_page].present? ? params[:per_page] : 10)
  end

  #GET /matches/immediate_index
  #GET /matches/immediate_index.json
  #即时指数
  def immediate_index
    @q = Match.immediate.ransack(params[:q])
    @matches = @q.result.paginate(page: params[:page], per_page: params[:per_page].present? ? params[:per_page] : 10)
  end

  #GET /matches/search_by_league
  #GET /matches/search_by_league.json
  #赛事筛选
  def search_by_league
    @q_leagues = League.ransack(params[:q])
    @leagues = @q_leagues.result
  end

  #GET /matches/show_recommand
  #GET /matches/show_recommand
  #推荐
  def show_recommand
    @q = Match.immediate.ransack(params[:q])
    @matches = @q.result
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
  end

  # GET /matches/new
  def new
    @match = Match.new
  end

  # GET /matches/1/edit
  def edit
  end

  #GET /matches/:id/show_bigata
  def show_bigdata
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = Match.new(match_params)

    respond_to do |format|
      if @match.save
        format.html { redirect_to @match, notice: 'Match was successfully created.' }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_url, notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      params[:match]
    end
end
