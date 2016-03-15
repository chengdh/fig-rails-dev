#coding: utf-8
#创建库存视图
class CreateStockInView < ActiveRecord::Migration
  def change
    execute "CREATE OR REPLACE VIEW v_stock_in AS " +
      " SELECT t_location_id,equipment_id,sum(qty) qty,sum(qty*price) amt FROM inout_lines WHERE state='confirmed' group by t_location_id,equipment_id"
    execute "CREATE OR REPLACE VIEW v_stock_out AS " +
      " SELECT f_location_id,equipment_id,sum(qty) qty,sum(qty*price) amt FROM inout_lines WHERE state='confirmed' group by f_location_id,equipment_id "
    execute "CREATE OR REPLACE VIEW v_stock AS " +
    " SELECT v_stock_in.t_location_id location_id,v_stock_in.equipment_id,(IFNULL(v_stock_in.qty,0) -IFNULL(v_stock_out.qty,0)) qty,"+
    " NOW() created_at," +
    " NOW() updated_at" +
    " FROM v_stock_in LEFT OUTER JOIN v_stock_out on" +
    " v_stock_in.t_location_id = v_stock_out.f_location_id" +
    " AND v_stock_in.equipment_id = v_stock_out.equipment_id"
  end
end
