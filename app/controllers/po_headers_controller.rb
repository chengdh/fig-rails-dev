#coding: utf-8
class PoHeadersController < ApplicationController
  before_action :set_po_header, only: [:show]

  # GET /cux_demands
  # GET /cux_demands.json
  def index
    @po_headers = PoHeader.all
  end

  # GET /cux_demands/1
  # GET /cux_demands/1.json
  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_po_header
    @po_header = PoHeader.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def po_header_params
    params[:po_header]
  end

end
