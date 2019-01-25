#coding: utf-8
#需求计划
class CuxDemandsController < ApplicationController
  before_action :set_cux_demand, only: [:show]

  # GET /cux_demands
  # GET /cux_demands.json
  def index
    @cux_demands = CuxDemand.all
  end

  # GET /cux_demands/1
  # GET /cux_demands/1.json
  def show
  end
  #GET /cux_demands/:id/show_with_itemkey/:itemkey
  def show_with_itemkey
    @cux_demand = CuxDemand.where(id: params[:id],wf_itemkey: params[:itemkey]).first
    render action: :show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cux_demand
    @cux_demand = CuxDemand.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cux_demand_params
    params[:cux_demand]
  end
end
