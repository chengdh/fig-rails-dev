#coding: utf-8
#无形资产-采购订单
class PurchaseOrderVirtual < BasePurchaseOrder
  def self.get_receipt_class
    ReceiptVirtual
  end
end
