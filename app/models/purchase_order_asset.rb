#coding: utf-8
#固定资产-采购单
class PurchaseOrderAsset < BasePurchaseOrder
  def self.get_receipt_class
    ReceiptAsset
  end
end
