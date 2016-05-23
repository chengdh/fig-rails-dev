#coding: utf-8
#设备-采购单
class PurchaseOrderIt < BasePurchaseOrder
  def self.get_receipt_class
    Receipt
  end
end
