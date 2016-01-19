#coding: utf-8
#盘口数据变化
class OddChangesController < ApplicationController
  before_action :set_odd_change, only: [:show, :edit, :update, :destroy]

  # GET /odd_changes
  # GET /odd_changes.json
  def index
    @odd_changes = OddChange.all
  end

  # GET /odd_changes/1
  # GET /odd_changes/1.json
  def show
  end

  # GET /odd_changes/new
  def new
    @odd_change = OddChange.new
  end

  # GET /odd_changes/1/edit
  def edit
  end

  # POST /odd_changes
  # POST /odd_changes.json
  def create
    @odd_change = OddChange.new(odd_change_params)

    respond_to do |format|
      if @odd_change.save
        format.html { redirect_to @odd_change, notice: 'Odd change was successfully created.' }
        format.json { render :show, status: :created, location: @odd_change }
      else
        format.html { render :new }
        format.json { render json: @odd_change.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /odd_changes/1
  # PATCH/PUT /odd_changes/1.json
  def update
    respond_to do |format|
      if @odd_change.update(odd_change_params)
        format.html { redirect_to @odd_change, notice: 'Odd change was successfully updated.' }
        format.json { render :show, status: :ok, location: @odd_change }
      else
        format.html { render :edit }
        format.json { render json: @odd_change.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /odd_changes/1
  # DELETE /odd_changes/1.json
  def destroy
    @odd_change.destroy
    respond_to do |format|
      format.html { redirect_to odd_changes_url, notice: 'Odd change was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_odd_change
      @odd_change = OddChange.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def odd_change_params
      params[:odd_change]
    end
end
