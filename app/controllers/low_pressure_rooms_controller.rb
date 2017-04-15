class LowPressureRoomsController < ElectricEquipmentsController
  defaults resource_class: LowPressureRoom
  table :org,:area,:fire_level_des,:equip_level_des,:build_date,:manage_org
  private

  def low_pressure_room_params
    params.require(:low_pressure_room).permit()
  end
end

