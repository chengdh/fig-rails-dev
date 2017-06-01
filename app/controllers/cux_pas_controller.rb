#coding: utf-8
class CuxPasController < ApplicationController
  before_action :set_cux_pa, only: [:show]

  # GET /cux_demands
  # GET /cux_demands.json
  def index
    @cux_pas = CuxPa.all
  end

  # GET /cux_demands/1
  # GET /cux_demands/1.json
  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cux_pa
    @cux_pa = CuxPa.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cux_pa_params
    params[:cux_pa]
  end
end