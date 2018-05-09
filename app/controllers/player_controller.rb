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
  
  #05.09.2018
  def updatePlayerData
    #Update Player information
    @player = Player.find(params[:id])
		
		if @player.update(player_params)
		  #If update was valid, render the updated info
			render json: @player
		else
		  #Else render status error
			head :error
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
  
  def get_pc_items
    pc = Pc.find(params[:id])

    render json: pc.items
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
    params.require(:player).permit(:name, :nickname, :image, :gm)
  end
  
  def pc_params
    params.require(:pc).permit(:player_id, :name, :race_id, :career_id)
  end
end
