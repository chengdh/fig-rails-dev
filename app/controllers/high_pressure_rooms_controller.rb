#coding: utf-8
class HighPressureRoomsController < ElectricEquipmentsController
  table :org,:area,:fire_level_des,:build_date,:manage_org

  private

  def high_pressure_room_params
    params.require(:electric_equipment).permit(:org_id, :area, :fire_level, :build_date, :manage_org, :qty, :buy_date, :power, :work_type, :last_check_date, :is_active, :note)
  end
end

