#coding: utf-8
#添加固定资产库存视图
class AddStockAssetView < ActiveRecord::Migration
  def up
    execute "CREATE OR REPLACE VIEW v_stock_asset_in AS " +
      " SELECT a.t_location_id,a.no,a.equipment_id,a.brand,b.model,a.purchase_date,a.own_org_id,a.duty_person,sum(a.qty) qty,sum(a.qty*price) amt FROM inout_lines a,equipment b " +
      " WHERE a.state='confirmed' AND a.equipment_id = b.id" +
      " AND b.type = 'EquipAsset'" +
      " group by a.t_location_id,a.no,a.equipment_id,a.brand,b.model,a.purchase_date,a.own_org_id,a.duty_person"

    execute "CREATE OR REPLACE VIEW v_stock_asset_out AS " +
      " SELECT a.f_location_id,a.no,a.equipment_id,a.brand,b.model,a.purchase_date,a.own_org_id,a.duty_person,sum(a.qty) qty,sum(a.qty*price) amt FROM inout_lines a,equipment b " +
      " WHERE a.state='confirmed' AND a.equipment_id = b.id" +
      " AND b.type = 'EquipAsset'" +
      " group by a.f_location_id,a.no,a.equipment_id,a.brand,b.model,a.purchase_date,a.own_org_id,a.duty_person"


    execute "CREATE OR REPLACE VIEW v_stock_asset AS " +
      " SELECT v_stock_asset_in.t_location_id location_id,v_stock_asset_in.equipment_id,(IFNULL(v_stock_asset_in.qty,0) -IFNULL(v_stock_asset_out.qty,0)) qty,"+
      " v_stock_asset_in.no,v_stock_asset_in.brand,v_stock_asset_in.model,v_stock_asset_in.purchase_date,v_stock_asset_in.own_org_id,v_stock_asset_in.duty_person, " +
      " NOW() created_at," +
      " NOW() updated_at" +
      " FROM v_stock_asset_in LEFT OUTER JOIN v_stock_asset_out on" +
      " v_stock_asset_in.t_location_id = v_stock_asset_out.f_location_id" +
      " AND v_stock_asset_in.equipment_id = v_stock_asset_out.equipment_id" +
      " AND v_stock_asset_in.no = v_stock_asset_out.no"
 
  end
  def down ; end
end
