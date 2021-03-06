class GmController < ApplicationController
  before_action :require_login

  def index
  end
  
  #05.05.18
  def gm_status
    #Does this player hav GM Privs?  If so, just return status OK
    head :ok
  end
  
  #05.05.18
  def get_all_pcs
    #Returns a list of all PCS
    @pcs = Pc.all
    
    #Render list as json
    #respond_to do |format|
      #format.json {
    render :get_all_pcs
    #  format.html {render nothing: true}
    #end
  end
  
  #05.05.18
  def modify_pc
    #Modify PC.  Only non-breaking attritubes can be changed
    @pc = Pc.find_by_id(params[:pc][:id])
    
    @pc.gm_modify(params[:pc], params[:pc][:skills])
    
    #Save the updated skills into the PC

    head :ok
  end
  
  def modify_pc_strain
    #Modify PC strain.  Can be + or -
    pc = Pc.find_by_id(params[:id])

    pc.modify_strain(params[:amount])
    
    t = Time.now
    time = t.strftime("%I:%M:%S")
    render status: :ok, json: {msg: pc.name + ": strain modified " + params[:amount].to_s, strain: pc.strain_current, time: time}
  end
  
  def modify_pc_wounds
    #Modify PC wounds
    pc = Pc.find_by_id(params[:id])

    pc.modify_wounds(params[:amount])

    t = Time.now
    time = t.strftime("%I:%M:%S")
    render status: :ok, json: {msg: pc.name + ": wounds modified " + params[:amount].to_s, wounds: pc.wounds_current, time: time}
  end

  #???
  def get_session_pcs
    #Returns a list of PCs in the current game session
    
    #Get the session we are needing
    g_session = Session.find_by_id(params[:id])
    
    #Get all PCs for g_session
    @pcs = g_session.pcs
    
    render json: @pcs
  end
  
  #???
  def add_session_pcs
    #Adds a PC to the game session
    #Get the session ID
    g_session = Session.find_by_id(params[:s_id])
    
    #Get the PC we are adding
    pc = Pc.find_by_id(params[:pc_id])
    
    #Add the PC to the session
    g_session.pcs << pc
    
    #Return the PCs for the session
    render json: g_session.pcs
  end

  #???
  def get_all_weapons
     #Get all weapons in the database
     weapons = Weapons.all

     render json: weapons
  end

  #05.05.2018
  def addWeaponToPc
    #Add the weapon to the PC
    #Get the PC and Weapon
    pc = Pc.find(params[:id])
    w = Weapon.find(params[:w_id])
    
    #Is this weapon a template weapon?  If so, then create a copy and assign
    #If not a template, assign to new owner
    if w.template?
      #Duplicate the weapon
      @newWeapon = w.deep_dup

      #New weapon is not a template
      @newWeapon.template = false

      #Save new weapon
      @newWeapon.save

      if pc.weapons << @newWeapon
        #Successful, render the new weapon
        render json: @newWeapon
      else
        #Error, send error
        head :error
      end
    else
      #Delete any old owners for the weapon
      w.pcs.delete_all

      #Duplicat the weapon
      @newWeapon = w.deep_dup

      #This is not a template weapon
      @newWeapon.template = false;

      #Save the new weapon
      @newWeapon.save

      #Assign to new owner
      if pc.weapons << @newWeapon
        #Successful, render the new weapon
        render json: @newWeapon
      else
        #Error, send error
        head :error
      end
    end
  end

  #05.05.2018
  def addArmorToPc
    #Add the weapon to the PC
    #Get the PC and Weapon
    pc = Pc.find(params[:id])
    a = Armor.find(params[:a_id])
    
    #Is this weapon a template weapon?  If so, then create a copy and assign
    #If not a template, assign to new owner
    if a.template?
      #Duplicate the weapon
      @newArmor = a.deep_dup

      #New weapon is not a template
      @newArmor.template = false

      #Save new weapon
      @newArmor.save

      if pc.armors << @newArmor
        #Successful, render the new weapon
        render json: @newArmor
      else
        #Error, send error
        head :error
      end
    else
      #Delete any old owners for the weapon
      a.pcs.delete_all

      #Duplicat the weapon
      @newArmor = a.deep_dup

      #This is not a template weapon
      @newArmor.template = false;

      #Save the new weapon
      @newArmor.save

      #Assign to new owner
      if pc.armors << @newArmor
        #Successful, render the new weapon
        render json: @newArmor
      else
        #Error, send error
        head :error
      end
    end
  end

  #05.05.2018
  def addItemToPc
    #Add the item to the PC
    #Get the PC and Item
    pc = Pc.find(params[:id])
    i = Item.find(params[:i_id])
    
    #Is this item a template item?  If so, then create a copy and assign
    #If not a template, assign to new owner
    if i.template?
      #Duplicate the item
      @newItem = i.deep_dup

      #New item is not a template
      @newItem.template = false

      #Save new item
      @newItem.save

      if pc.items << @newItem
        #Successful, render the new item
        render json: @newItem
      else
        #Error, send error
        head :error
      end
    else
      #Delete any old owners for the item
      i.pcs.delete_all

      #Duplicat the item
      @newItem = i.deep_dup

      #This is not a template item
      @newItem.template = false;

      #Save the new item
      @newItem.save

      #Assign to new owner
      if pc.items << @newItem
        #Successful, render the new item
        render json: @newItem
      else
        #Error, send error
        head :error
      end
    end
  end

  #05.09.2018
  def removeWeaponFromPc
    #Remove the owner of this weapon
    w = Weapon.find(params[:w_id])

    w.pcs.delete_all
  end

  #05.09.2018
  def removeArmorFromPc
    #Remove the owner of this armor
    a = Armor.find(params[:a_id])

    a.pcs.delete_all
  end

  #05.09.2018
  def removeItemFromPc
    #Remove the owner of this item
    i = Item.find(params[:i_id])

    i.pcs.delete_all
  end

  private
  def require_login
    unless player_signed_in? and current_player.gm == true
      head :forbidden
    end
  end
end