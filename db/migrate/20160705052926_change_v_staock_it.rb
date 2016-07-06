#coding: utf-8
class ChangeVStaockIt < ActiveRecord::Migration
  def up
    execute "CREATE OR REPLACE VIEW v_stock_it_in AS " +
      " SELECT a.t_location_id,a.no,a.equipment_id,sum(a.qty) qty,sum(a.qty*price) amt FROM inout_lines a,equipment b " +
      " WHERE a.state='confirmed' AND a.equipment_id = b.id" +
      " AND b.type = 'EquipIt'" +
      " group by a.t_location_id,a.no,a.equipment_id"

    execute "CREATE OR REPLACE VIEW v_stock_it_out AS " +
      " SELECT a.f_location_id,a.no,a.equipment_id,sum(a.qty) qty,sum(a.qty*price) amt FROM inout_lines a,equipment b " +
      " WHERE a.state='confirmed' AND a.equipment_id = b.id" +
      " AND b.type = 'EquipIt'" +
      " group by a.f_location_id,a.no,a.equipment_id"


    execute "CREATE OR REPLACE VIEW v_stock_it AS " +
      " SELECT v_stock_it_in.t_location_id location_id,v_stock_it_in.equipment_id,(IFNULL(v_stock_it_in.qty,0) -IFNULL(v_stock_it_out.qty,0)) qty,"+
      " v_stock_it_in.no," +
      " NOW() created_at," +
      " NOW() updated_at" +
      " FROM v_stock_it_in LEFT OUTER JOIN v_stock_it_out on" +
      " v_stock_it_in.t_location_id = v_stock_it_out.f_location_id" +
      " AND v_stock_it_in.equipment_id = v_stock_it_out.equipment_id" +
      " AND v_stock_it_in.no = v_stock_it_out.no"


    execute "CREATE OR REPLACE VIEW v_stock_asset_in AS " +
      " SELECT a.t_location_id,a.no,a.equipment_id,sum(a.qty) qty,sum(a.qty*price) amt FROM inout_lines a,equipment b " +
      " WHERE a.state='confirmed' AND a.equipment_id = b.id" +
      " AND b.type = 'EquipAsset'" +
      " group by a.t_location_id,a.no,a.equipment_id"

    execute "CREATE OR REPLACE VIEW v_stock_asset_out AS " +
      " SELECT a.f_location_id,a.no,a.equipment_id,sum(a.qty) qty,sum(a.qty*price) amt FROM inout_lines a,equipment b " +
      " WHERE a.state='confirmed' AND a.equipment_id = b.id" +
      " AND b.type = 'EquipAsset'" +
      " group by a.f_location_id,a.no"


    execute "CREATE OR REPLACE VIEW v_stock_asset AS " +
      " SELECT v_stock_asset_in.t_location_id location_id,v_stock_asset_in.equipment_id,(IFNULL(v_stock_asset_in.qty,0) -IFNULL(v_stock_asset_out.qty,0)) qty,"+
      " v_stock_asset_in.no, " +
      " NOW() created_at," +
      " NOW() updated_at" +
      " FROM v_stock_asset_in LEFT OUTER JOIN v_stock_asset_out on" +
      " v_stock_asset_in.t_location_id = v_stock_asset_out.f_location_id" +
      " AND v_stock_asset_in.equipment_id = v_stock_asset_out.equipment_id" +
      " AND v_stock_asset_in.no = v_stock_asset_out.no"

    execute "CREATE OR REPLACE VIEW v_stock_consume_in AS " +
      " SELECT a.t_location_id,a.equipment_id,b.brand,b.model,sum(a.qty) qty,sum(a.qty*price) amt FROM inout_lines a,equipment b " +
      " WHERE a.state='confirmed' AND a.equipment_id = b.id" +
      " AND b.type = 'EquipConsume'" +
      " group by a.t_location_id,a.equipment_id,b.brand,b.model"

    execute "CREATE OR REPLACE VIEW v_stock_consume_out AS " +
      " SELECT a.f_location_id,a.equipment_id,b.brand,b.model,sum(a.qty) qty,sum(a.qty*price) amt FROM inout_lines a,equipment b " +
      " WHERE a.state='confirmed' AND a.equipment_id = b.id" +
      " AND b.type = 'EquipConsume'" +
      " group by a.f_location_id,a.equipment_id,b.brand,b.model"


    execute "CREATE OR REPLACE VIEW v_stock_consume AS " +
      " SELECT v_stock_consume_in.t_location_id location_id,v_stock_consume_in.equipment_id,(IFNULL(v_stock_consume_in.qty,0) -IFNULL(v_stock_consume_out.qty,0)) qty,"+
      " v_stock_consume_in.brand,v_stock_consume_in.model, " +
      " NOW() created_at," +
      " NOW() updated_at" +
      " FROM v_stock_consume_in LEFT OUTER JOIN v_stock_consume_out on" +
      " v_stock_consume_in.t_location_id = v_stock_consume_out.f_location_id" +
      " AND v_stock_consume_in.equipment_id = v_stock_consume_out.equipment_id"

    execute "CREATE OR REPLACE VIEW v_stock_virtual_in AS " +
      " SELECT a.t_location_id,a.no,a.equipment_id,b.brand,b.model,sum(a.qty) qty,sum(a.qty*price) amt FROM inout_lines a,equipment b " +
      " WHERE a.state='confirmed' AND a.equipment_id = b.id" +
      " AND b.type = 'EquipVirtual'" +
      " group by a.t_location_id,a.equipment_id,b.brand,b.model"

    execute "CREATE OR REPLACE VIEW v_stock_virtual_out AS " +
      " SELECT a.f_location_id,a.no,a.equipment_id,b.brand,b.model,sum(a.qty) qty,sum(a.qty*price) amt FROM inout_lines a,equipment b " +
      " WHERE a.state='confirmed' AND a.equipment_id = b.id" +
      " AND b.type = 'EquipVirtual'"+
      " group by a.f_location_id,a.equipment_id,b.brand,b.model"


    execute "CREATE OR REPLACE VIEW v_stock_virtual AS " +
      " SELECT v_stock_virtual_in.t_location_id location_id,v_stock_virtual_in.equipment_id,(IFNULL(v_stock_virtual_in.qty,0) -IFNULL(v_stock_virtual_out.qty,0)) qty,"+
      " v_stock_virtual_in.brand,v_stock_virtual_in.model, " +
      " NOW() created_at," +
      " NOW() updated_at" +
      " FROM v_stock_virtual_in LEFT OUTER JOIN v_stock_virtual_out on" +
      " v_stock_virtual_in.t_location_id = v_stock_virtual_out.f_location_id" +
      " AND v_stock_virtual_in.equipment_id = v_stock_virtual_out.equipment_id"
  end
end
