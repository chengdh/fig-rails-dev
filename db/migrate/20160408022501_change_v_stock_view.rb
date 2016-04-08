#coding: utf-8
#修改stock 视图
class ChangeVStockView < ActiveRecord::Migration
  def change
    execute "CREATE OR REPLACE VIEW v_stock_in AS " +
      " SELECT t_location_id,no,equipment_id,brand,model,purchase_date,own_org_id,duty_person,sum(qty) qty,sum(qty*price) amt FROM inout_lines " +
      " WHERE state='confirmed' group by t_location_id,no,equipment_id,no,brand,model,purchase_date,own_org_id,duty_person"

    execute "CREATE OR REPLACE VIEW v_stock_out AS " +
      " SELECT f_location_id,no,equipment_id,brand,model,purchase_date,own_org_id,duty_person,sum(qty) qty,sum(qty*price) amt FROM inout_lines " +
      " WHERE state='confirmed' group by t_location_id,no,equipment_id,no,brand,model,purchase_date,own_org_id,duty_person"

    execute "CREATE OR REPLACE VIEW v_stock AS " +
    " SELECT v_stock_in.t_location_id location_id,v_stock_in.equipment_id,(IFNULL(v_stock_in.qty,0) -IFNULL(v_stock_out.qty,0)) qty,"+
    " v_stock_in.no,v_stock_in.brand,v_stock_in.model,v_stock_in.purchase_date,v_stock_in.own_org_id,v_stock_in.duty_person, " +
    " NOW() created_at," +
    " NOW() updated_at" +
    " FROM v_stock_in LEFT OUTER JOIN v_stock_out on" +
    " v_stock_in.t_location_id = v_stock_out.f_location_id" +
    " AND v_stock_in.equipment_id = v_stock_out.equipment_id" +
    " AND v_stock_in.no = v_stock_out.no"
  end
end
