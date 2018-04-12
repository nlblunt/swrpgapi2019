class WeaponController < ApplicationController
  def index
    @weapons = Weapon.all

    render json: @weapons
  end

  def create
	@weapon = Weapon.create(weapon_params)

	if @weapon.valid?
		head :created
	else
		head :error
	end
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
	@weapon = Weapon.find_by_id(params[:id])

	if @weapon.destroy
		head :ok
	else
		head :error
	end
  end

  private
  def weapon_params
	params.require(:weapon).permit(:name, :skill_id, :damage, :critical, :range, :price, :special, :description, :notes)
  end
end
