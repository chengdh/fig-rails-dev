#coding: utf-8
#无形资产库存
class AddStockVirtualView < ActiveRecord::Migration
  def up
    execute "CREATE OR REPLACE VIEW v_stock_virtual_in AS " +
      " SELECT a.t_location_id,a.no,a.equipment_id,a.brand,b.model,sum(a.qty) qty,sum(a.qty*price) amt FROM inout_lines a,equipment b " +
      " WHERE a.state='confirmed' AND a.equipment_id = b.id" +
      " AND b.type = 'EquipVirtual'" +
      " group by a.t_location_id,a.equipment_id,a.brand,b.model"

    execute "CREATE OR REPLACE VIEW v_stock_virtual_out AS " +
      " SELECT a.f_location_id,a.no,a.equipment_id,a.brand,b.model,sum(a.qty) qty,sum(a.qty*price) amt FROM inout_lines a,equipment b " +
      " WHERE a.state='confirmed' AND a.equipment_id = b.id" +
      " AND b.type = 'EquipVirtual'"+
      " group by a.f_location_id,a.equipment_id,a.brand,b.model"


    execute "CREATE OR REPLACE VIEW v_stock_virtual AS " +
      " SELECT v_stock_virtual_in.t_location_id location_id,v_stock_virtual_in.equipment_id,(IFNULL(v_stock_virtual_in.qty,0) -IFNULL(v_stock_virtual_out.qty,0)) qty,"+
      " v_stock_virtual_in.brand,v_stock_virtual_in.model, " +
      " NOW() created_at," +
      " NOW() updated_at" +
      " FROM v_stock_virtual_in LEFT OUTER JOIN v_stock_virtual_out on" +
      " v_stock_virtual_in.t_location_id = v_stock_virtual_out.f_location_id" +
      " AND v_stock_virtual_in.equipment_id = v_stock_virtual_out.equipment_id"
  end
  def down ; end
end
