class WeaponController < ApplicationController
  def index
    @weapons = Weapon.all

    render json: @weapons
  end

  def create
  end

  def update
	@weapon = Weapon.find_by_id(params[:id])

	#Update the weapon
	if @weapon.update(weapon_params)
		head :ok
	else
		head :error
	end
  end

  def destroy
  end

  private
  def weapon_params
	params.require(:weapon).permit(:name, :skill_id, :damage, :critical, :range, :price, :special, :description, :notes)
  end
end
