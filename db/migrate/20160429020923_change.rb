#coding: utf-8
#修改库存视图
class Change < ActiveRecord::Migration
  def up
    execute "CREATE OR REPLACE VIEW v_stock_it_in AS " +
      " SELECT a.t_location_id,a.no,a.equipment_id,a.brand,a.model,a.purchase_date,a.own_org_id,a.duty_person,sum(a.qty) qty,sum(a.qty*price) amt FROM inout_lines a,equipment b " +
      " WHERE a.state='confirmed' AND a.equipment_id = b.id" +
      " AND b.type = 'EquipIt'" +
      " group by a.t_location_id,a.no,a.equipment_id,a.brand,a.model,a.purchase_date,a.own_org_id,a.duty_person"

    execute "CREATE OR REPLACE VIEW v_stock_it_out AS " +
      " SELECT a.f_location_id,a.no,a.equipment_id,a.brand,a.model,a.purchase_date,a.own_org_id,a.duty_person,sum(a.qty) qty,sum(a.qty*price) amt FROM inout_lines a,equipment b " +
      " WHERE a.state='confirmed' AND a.equipment_id = b.id" +
      " AND b.type = 'EquipIt'" + 
      " group by a.f_location_id,a.no,a.equipment_id,a.brand,a.model,a.purchase_date,a.own_org_id,a.duty_person"


    execute "CREATE OR REPLACE VIEW v_stock_it AS " +
      " SELECT v_stock_it_in.t_location_id location_id,v_stock_it_in.equipment_id,(IFNULL(v_stock_it_in.qty,0) -IFNULL(v_stock_it_out.qty,0)) qty,"+
      " v_stock_it_in.no,v_stock_it_in.brand,v_stock_it_in.model,v_stock_it_in.purchase_date,v_stock_it_in.own_org_id,v_stock_it_in.duty_person, " +
      " NOW() created_at," +
      " NOW() updated_at" +
      " FROM v_stock_it_in LEFT OUTER JOIN v_stock_it_out on" +
      " v_stock_it_in.t_location_id = v_stock_it_out.f_location_id" +
      " AND v_stock_it_in.equipment_id = v_stock_it_out.equipment_id" +
      " AND v_stock_it_in.no = v_stock_it_out.no"
  end
  def down ; end
end
