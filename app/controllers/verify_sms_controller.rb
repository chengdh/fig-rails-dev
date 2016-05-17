class VerifySmsController < ApplicationController
  before_action :set_verify_sm, only: [:show, :edit, :update, :destroy]

  # GET /verify_sms
  # GET /verify_sms.json
  def index
    @verify_sms = VerifySm.all
  end

  # GET /verify_sms/1
  # GET /verify_sms/1.json
  def show
  end

  # GET /verify_sms/new
  def new
    @verify_sm = VerifySm.new
  end

  # GET /verify_sms/1/edit
  def edit
  end

  # POST /verify_sms
  # POST /verify_sms.json
  def create
    @verify_sm = VerifySm.new(verify_sm_params)
    @verify_sm.send_verify_sms

    respond_to do |format|
      if @verify_sm.save
        format.html { redirect_to @verify_sm, notice: 'Verify sm was successfully created.' }
        format.json { render :show, status: :created, location: @verify_sm }
      else
        format.html { render :new }
        format.json { render json: @verify_sm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /verify_sms/1
  # PATCH/PUT /verify_sms/1.json
  def update
    respond_to do |format|
      if @verify_sm.update(verify_sm_params)
        format.html { redirect_to @verify_sm, notice: 'Verify sm was successfully updated.' }
        format.json { render :show, status: :ok, location: @verify_sm }
      else
        format.html { render :edit }
        format.json { render json: @verify_sm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /verify_sms/1
  # DELETE /verify_sms/1.json
  def destroy
    @verify_sm.destroy
    respond_to do |format|
      format.html { redirect_to verify_sms_url, notice: 'Verify sm was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_verify_sm
      @verify_sm = VerifySm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def verify_sm_params
      params.require(:verify_sm).permit(:mobile, :verity_type)
    end
end
