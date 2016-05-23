#coding: utf-8
#易耗品-采购订单
class PurchaseOrderConsume < BasePurchaseOrder
  def self.get_receipt_class
    ReceiptConsume
  end
end
