class PlayerController < ApplicationController
      before_action :authenticate_player!, only: [:get_player_pcs, :update, :create_pc]
  
  def index
  end

  def create
		user = User.create(user_params)
		player = user.create_player(player_params)
		
		if player.valid?
			render :nothing => true, :status => :created
		else
			render :nothing => true, :status => :error
		end
  end
  
  def update
    #Update User and Player information
    #params[:id, :user_params(), :player_params()]
    @user = User.find(params[:id])
		
		if @user.update(user_params) and @user.player.update
		  #If update was valid, render the updated info
			render json: @user.player
		else
		  #Else render status error
			render status: :error, nothing: true
		end  
  end
  
  def player_check
    if user_signed_in?
      render status: :ok, json: current_user.player
    else
      render status: :forbidden, nothing: true
    end
  end
  
  def create_pc
    #Create a new PC for the player
    #params[:id, :pc_params(:name, :race_id, :career_id)]
    @pc = Pc.create!(pc_params)
    

    
    if @pc.valid?
      #PC is valid, assign to player with passed ID
      
      #Initials PC
      @pc.init
      
      #Save the pc to the current player
      #@player = Player.find(params[:id])
      #@player.pcs << @pc
      
      #render json: pc
	render :get_pc
    else
      #PC is invalid
      render status: :error, nothing: true
    end
  end
  
  def delete_pc
    pc = Pc.find_by_id(params[:id])
    
    pc.destroy
    
    head :ok
    
  end
  
  def get_player_pcs
    #player = Player.find(params[:id])
    player = Player.find(params[:id])
    

    @pcs = player.pcs
    #render json: @pcs
    render :get_player_pcs

    #render json: @pcs
    #respond_to do |format|
    #  format.json {render :get_player_pcs}
      #format.html {render nothing: true}
    #end
  end
  
  def get_pc
    @pc = Pc.find(params[:id])
    
    #render json: @pc
    render :get_pc
  end
  
  def get_pc_skills
    #Get the PC we are needing the skills for
    @pc = Pc.find(params[:id])
    
    @skills = @pc.pcs_skills(true)
    
    render :get_pc_skills
  end
  
  def get_pc_weapons
    #Gets the PC weapons
    pc = Pc.find(params[:id])
    @weapons = pc.weapons

    render :get_pc_weapons
  end

  def add_weapon
      #Add the weapon to the PC
      pc = Pc.find(params[:id])
      w = Weapon.find(params[:w_id])
      
      if pc.weapons << w
          render json: {msg: "Added weapon"}
      else
          render status: :error, json: {e: "Error adding weapon"}
      end
  end
    
  def delete_weapon
      #Get the pcs_weapon row to delete
      pcs_weapon = PcsWeapon.find_by_id(params[:id])
    
      #delete the pcs_weapon row
      if pcs_weapon.valid?
          pcs_weapon.delete
          render json: {msg: "Weapon deleted"}
      else
          render status: :error, json: {e: "Error deleting weapon"}
      end
  end
  
  def get_pc_armor
    pc = Pc.find(params[:id])

    render json: pc.armors
  end

  def add_armor
    #Add the armor to the PC
      pc = Pc.find(params[:id])
      a = Armor.find(params[:a_id])
      
      if pc.armors << a
          render json: {msg: "Added armor"}
      else
          render status: :error, json: {e: "Error adding armor"}
      end
  end
  
  def delete_armor
    #Delete the armor from the PC
      armors_pcs = ArmorsPc.find_by_id(params[:id])
    
      #delete the armors_pcs row
      if armors_pcs.valid?
          armors_pcs.delete
          render json: {msg: "Armor deleted"}
      else
          render status: :error, json: {e: "Error deleting armor"}
      end
  end
  
  def get_pc_items
    pc = Pc.find(params[:id])

    render json: pc.items
  end

  def add_item
    #Add the item to the PC
    pc = Pc.find(params[:id])
    i = Item.find(params[:i_id])
      
    if pc.items << i
      render json: {msg: "Added item"}
    else
      render status: :error, json: {e: "Error adding item"}
    end
  end
  
  def delete_item
    #Delete the item from the PC
    items_pcs = ItemsPc.find_by_id(params[:id])
    
    #delete the items_pcs row
    if items_pcs.valid?
      items_pcs.delete
      render json: {msg: "Item deleted"}
      else
      render status: :error, json: {e: "Error deleting item"}
      end
  end
  
  def get_pc_career_skills
    #Get the PC we are needing the career skills for
    pc = Pc.find(params[:id])
    
    @skills = pc.get_career_skills
    
    render :get_pc_career_skills
    
  end
  
  def get_pc_xp
    pc = Pc.find(params[:id])
    @xp = pc.xp
    
    render json: {xp: @xp}
    #render json: @xp
  end
  
  def increase_skill_rank
    #Increase the skill rank
    #Get the PC we are increasing the rank for
    @pc = Pc.find(params[:id])
    
    #Increase the skill rank and return the status
    result = @pc.increase_skill_rank(params[:skill_id], params[:use_xp])
    
    render json: result
  end
  
  def increase_attribute
    @pc = Pc.find(params[:id])
    
    result = @pc.increase_attribute(params[:attribute])
    
    render json: result
  end
  
  def set_specialization
    @pc = Pc.find(params[:id])  
   
    #Attempt to set a new specialization and save the result
    result = @pc.set_specialization(params[:spec_id], params[:use_xp])
    
    render :status => result[:status], json: result
  end
  
  def finalize_pc
    #Sets the PC status
    @pc = Pc.find(params[:id])
    
    @pc.set_status('active')#(params[:status])
    
    render json: {msg: @pc.name + " finalized and active"}
  end
  
  private
  
  def player_params
    params.require(:player).permit(:name)
  end
  
  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
  
  def pc_params
    params.require(:pc).permit(:player_id, :name, :race_id, :career_id)
  end
end
