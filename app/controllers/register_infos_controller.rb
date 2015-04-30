class RegisterInfosController < ApplicationController
  before_action :set_register_info, only: [:show, :edit, :update, :destroy]

  # GET /register_infos
  # GET /register_infos.json
  def index
    @register_infos = RegisterInfo.all
  end

  # GET /register_infos/1
  # GET /register_infos/1.json
  def show
  end

  # GET /register_infos/new
  def new
    @register_info = RegisterInfo.new
  end

  # GET /register_infos/1/edit
  def edit
  end

  # POST /register_infos
  # POST /register_infos.json
  def create
    @register_info = RegisterInfo.new(register_info_params)

    respond_to do |format|
      if @register_info.save
        format.html { redirect_to @register_info, notice: 'Register info was successfully created.' }
        format.json { render :show, status: :created, location: @register_info }
      else
        format.html { render :new }
        format.json { render json: @register_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /register_infos/1
  # PATCH/PUT /register_infos/1.json
  def update
    respond_to do |format|
      if @register_info.update(register_info_params)
        format.html { redirect_to @register_info, notice: 'Register info was successfully updated.' }
        format.json { render :show, status: :ok, location: @register_info }
      else
        format.html { render :edit }
        format.json { render json: @register_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /register_infos/1
  # DELETE /register_infos/1.json
  def destroy
    @register_info.destroy
    respond_to do |format|
      format.html { redirect_to register_infos_url, notice: 'Register info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_register_info
      @register_info = RegisterInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def register_info_params
      params.require(:register_info).permit(:company_name)
    end
end
