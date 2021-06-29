class ShoesController < ApplicationController 
    def index  
        @shoes = Shoe.all
    end

    def show
        @shoe = Shoe.find_by_id(params[:id])
    end

    def most_expensive
        @shoes = Shoe.order_by_price
        render :index
    end

    def new
         @shoe = Shoe.new
    end

    def edit 
        @shoe = Shoe.find_by_id(params[:id])
    end

    def update 
        @shoe = Shoe.find_by_id(params[:id])
        @shoe.update(shoe_params)
        if @shoe.valid? 
            redirect_to shoe_path(@shoe)
        else 
            render :edit
        end
    end

    def create 
        # binding.pry
       @shoe = Shoe.new(shoe_params)
       if @shoe.save 
        redirect_to shoes_path 
       else
        render :new
       end
    end

    def destroy
        @shoe = Shoe.find_by_id(params[:id])
        @shoe.destroy
        redirect_to shoes_path
    end

    private 
    def shoe_params 
        params.require(:shoe).permit(:name, :color, :price)
    end
end