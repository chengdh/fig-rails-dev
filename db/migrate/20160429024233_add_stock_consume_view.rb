#coding: utf-8
class AddStockConsumeView < ActiveRecord::Migration
  def up
    execute "CREATE OR REPLACE VIEW v_stock_consume_in AS " +
      " SELECT a.t_location_id,a.equipment_id,a.brand,a.model,sum(a.qty) qty,sum(a.qty*price) amt FROM inout_lines a,equipment b " +
      " WHERE a.state='confirmed' AND a.equipment_id = b.id" +
      " AND b.type = 'EquipConsume'" +
      " group by a.t_location_id,a.equipment_id,a.brand,a.model"

    execute "CREATE OR REPLACE VIEW v_stock_consume_out AS " +
      " SELECT a.f_location_id,a.equipment_id,a.brand,a.model,sum(a.qty) qty,sum(a.qty*price) amt FROM inout_lines a,equipment b " +
      " WHERE a.state='confirmed' AND a.equipment_id = b.id" +
      " AND b.type = 'EquipConsume'" +
      " group by a.f_location_id,a.equipment_id,a.brand,a.model"


    execute "CREATE OR REPLACE VIEW v_stock_consume AS " +
      " SELECT v_stock_consume_in.t_location_id location_id,v_stock_consume_in.equipment_id,(IFNULL(v_stock_consume_in.qty,0) -IFNULL(v_stock_consume_out.qty,0)) qty,"+
      " v_stock_consume_in.brand,v_stock_consume_in.model, " +
      " NOW() created_at," +
      " NOW() updated_at" +
      " FROM v_stock_consume_in LEFT OUTER JOIN v_stock_consume_out on" +
      " v_stock_consume_in.t_location_id = v_stock_consume_out.f_location_id" +
      " AND v_stock_consume_in.equipment_id = v_stock_consume_out.equipment_id"
  end
  def down ; end
end
