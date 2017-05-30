#coding: utf-8
class MaximoMsgsController < ApplicationController
  before_action :set_maximo_msg, only: [:show]

  # GET /cux_demands
  # GET /cux_demands.json
  def index
    @maximo_msgs = MaximoMsg.all
  end

  # GET /cux_demands/1
  # GET /cux_demands/1.json
  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_maximo_msg
    @maximo_msg = MaximoMsg.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def maximo_msg_params
    params[:maximo_msg]
  end
end
