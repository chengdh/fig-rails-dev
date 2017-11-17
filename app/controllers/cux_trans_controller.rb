#coding: utf-8
class CuxTransController < ApplicationController
  before_action :set_cux_tran, only: [:show]

  # GET /cux_trans
  # GET /cux_trans.json
  def index
    @cux_trans = CuxTran.all
  end

  # GET /cux_trans/1
  # GET /cux_trans/1.json
  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cux_tran
    @cux_tran = CuxTran.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cux_tran_params
    params[:cux_tran]
  end

end
