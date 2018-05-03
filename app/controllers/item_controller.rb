class ItemController < ApplicationController
    def index
        @Items = Item.all
    
        render json: @Items
      end
    
      def create
        @Item = Item.create(item_params)
    
        if @Item.valid?
            head :created
        else
            head :error
        end
      end
    
      def update
        @Item = Item.find_by_id(params[:id])
    
        #Update the Item
        if @Item.update(item_params
)
            head :ok
        else
            head :error
        end
      end
    
      def destroy
        @Item = Item.find_by_id(params[:id])
    
        if @Item.destroy
            head :ok
        else
            head :error
        end
      end
    
      private
      def item_params
        params.require(:item).permit(:name, :price, :description, :notes, :template)
      end
end
