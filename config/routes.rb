Rails.application.routes.draw do
  mount_devise_token_auth_for 'Player', at: 'auth'

  #RESOURCES
  resources :weapon
  resources :armor
  resources :item

  #GM CONTROLLER ROUTES
  get 'gm/gm_status' => "gm#gm_status"
  get 'gm/get_all_pcs' => "gm#get_all_pcs"
  post 'gm/modify_pc' => "gm#modify_pc"
  post 'gm/modify_pc_strain' => "gm#modify_pc_strain"
  post 'gm/modify_pc_wounds' => "gm#modify_pc_wounds"
  post 'gm/get_session_pcs' => "gm#get_session_pcs"
  post 'gm_add_session_pcs' => "gm#add_session_pcs"
  get 'gm/get_all_weapons' => "gm#get_all_weapons"
  post 'gm/addWeaponToPc' => "gm#addWeaponToPc"
  
  #CAREER CONTROLLER ROUTES
  get 'career/index'
  get "career/get-career-specializations/:id" => "career#get_career_specializations"
  #get "career/get_all_specializations" => "career#get_all_specializations"
  get "career/get-career-specialization-skills/:id" => "career#get_specialization_career_skills"
  
  #PLAYER CONTROLLER ROUTES
  #resources :player
  #get "player/get_pc/:id" => "player#get_pc"
  post "player/get-player-pcs" => "player#get_player_pcs"
  #get "users/player_check" => "player#player_check"
  post "player/pc-create" => "player#create_pc"
  post "player/delete_pc" => "player#delete_pc"
  get "player/get-pc-xp/:id" => "player#get_pc_xp"
  post "player/get-pc-skills" => "player#get_pc_skills"
  #get "player/get_pc_career_skills/:id" => "player#get_pc_career_skills"
  post "player/increase-skill-rank" => "player#increase_skill_rank"
  post "player/increase-attribute" => "player#increase_attribute"
  post "player/set-specialization" => "player#set_specialization"
  post "player/finalize-pc" => "player#finalize_pc"
  #post "player/get_pc_weapons" => "player#get_pc_weapons"
  #post "player/get_pc_armor" => "player#get_pc_armor"
  #post "player/get_pc_items" => "player#get_pc_items"
  #post "player/add_weapon" => "player#add_weapon"
  #post "player/delete_weapon" => "player#delete_weapon"
  #post "player/add_armor" => "player#add_armor"
  #post "player/delete_armor" => "player#delete_armor"
  #post "player/add_item" => "player#add_item"
  #post "player/delete_item" => "player#delete_item"
  
  #RACE CONTROLLER ROUTES
  get 'race/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
