#coding: utf-8
class CuxApInvoicesController < ApplicationController
  before_action :set_cux_ap_invoice, only: [:show]

  # GET /cux_demands
  # GET /cux_demands.json
  def index
    @cux_ap_invoices = CuxApInvoide.all
  end

  # GET /cux_demands/1
  # GET /cux_demands/1.json
  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cux_ap_invoice
    @cux_ap_invoice = CuxApInvoice.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cux_ap_invoice_params
    params[:cux_ap_invoice].permit!
  end

end
