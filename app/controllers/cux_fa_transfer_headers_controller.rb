#coding: utf-8
class CuxFaTransferHeadersController < ApplicationController
  before_action :set_cux_fa_transfer_header, only: [:show]

  # GET /cux_demands
  # GET /cux_demands.json
  def index
    @cux_fa_transfer_header = CuxFaTransferHeader.all
  end

  # GET /cux_demands/1
  # GET /cux_demands/1.json
  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cux_fa_transfer_header
    @cux_fa_transfer_header = CuxFaTransferHeader.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cux_fa_transfer_header_params
    params[:cux_fa_transfer_header]
  end

end
