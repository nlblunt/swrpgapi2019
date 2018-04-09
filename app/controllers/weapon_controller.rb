class WeaponController < ApplicationController
  def index
    @weapons = Weapon.all

    render json: @weapons
  end

  def create
  end

  def update
  end

  def destroy
  end
end
