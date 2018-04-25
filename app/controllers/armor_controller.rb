class ArmorController < ApplicationController
    def index
        @Armors = Armor.all
    
        render json: @Armors
      end
    
      def create
        @Armor = Armor.create(armor_params)
    
        if @Armor.valid?
            head :created
        else
            head :error
        end
      end
    
      def update
        @Armor = Armor.find_by_id(params[:id])
    
        #Update the Armor
        if @Armor.update(armor_params)
            head :ok
        else
            head :error
        end
      end
    
      def destroy
        @Armor = Armor.find_by_id(params[:id])
    
        if @Armor.destroy
            head :ok
        else
            head :error
        end
      end
    
      private
      def armor_params
        params.require(:Armor).permit(:name, :defense, :soak, :price, :description, :notes, :template)
      end
end
