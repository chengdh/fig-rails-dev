#coding: utf-8
#总账
class CuxGlJeHeadersController < ApplicationController
  before_action :set_cux_gl_je_header, only: [:show]

  # GET /cux_demands
  # GET /cux_demands.json
  def index
    @cux_gl_je_header = CuxGlJeHeader.all
  end

  # GET /cux_demands/1
  # GET /cux_demands/1.json
  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cux_gl_je_header
    @cux_gl_je_header = CuxGlJeHeader.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cux_gl_je_header_params
    params[:cux_gl_je_header]
  end
end
