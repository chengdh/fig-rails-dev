class FeeInfosController < ApplicationController
  before_action :set_fee_info, only: [:show, :edit, :update, :destroy]

  # GET /fee_infos
  # GET /fee_infos.json
  def index
    @fee_infos = FeeInfo.all
  end

  # GET /fee_infos/1
  # GET /fee_infos/1.json
  def show
  end

  # GET /fee_infos/new
  def new
    @fee_info = FeeInfo.new
  end

  # GET /fee_infos/1/edit
  def edit
  end

  # POST /fee_infos
  # POST /fee_infos.json
  def create
    @fee_info = FeeInfo.new(fee_info_params)

    respond_to do |format|
      if @fee_info.save
        format.html { redirect_to @fee_info, notice: 'Fee info was successfully created.' }
        format.json { render :show, status: :created, location: @fee_info }
      else
        format.html { render :new }
        format.json { render json: @fee_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fee_infos/1
  # PATCH/PUT /fee_infos/1.json
  def update
    respond_to do |format|
      if @fee_info.update(fee_info_params)
        format.html { redirect_to @fee_info, notice: 'Fee info was successfully updated.' }
        format.json { render :show, status: :ok, location: @fee_info }
      else
        format.html { render :edit }
        format.json { render json: @fee_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fee_infos/1
  # DELETE /fee_infos/1.json
  def destroy
    @fee_info.destroy
    respond_to do |format|
      format.html { redirect_to fee_infos_url, notice: 'Fee info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /fee_infos/search
  #
  def search
    render partial: "search_form"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fee_info
      @fee_info = FeeInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fee_info_params
      params.require(:fee_info).permit(:user_id, :fee_date, :cr, :dr, :note)
    end
end
