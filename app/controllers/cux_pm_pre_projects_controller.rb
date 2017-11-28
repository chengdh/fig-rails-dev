#coding: utf-8
#前期立项
class CuxPmPreProjectsController < ApplicationController
  before_action :set_cux_pm_pre_project, only: [:show]

  # GET /cux_demands
  # GET /cux_demands.json
  def index
    @cux_pm_pre_project = CuxPmPreProject.all
  end

  # GET /cux_demands/1
  # GET /cux_demands/1.json
  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cux_pm_pre_project
    @cux_pm_pre_project = CuxPmPreProject.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cux_pm_pre_project_params
    params[:cux_pm_pre_project]
  end
end
