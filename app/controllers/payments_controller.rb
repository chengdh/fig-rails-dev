#coding: utf-8
#用户付费记录
class PaymentsController < ApplicationController
  def index
    @q = Payment.where(st: 1).ransack(params[:q])
    @payments = @q.result
  end
end
