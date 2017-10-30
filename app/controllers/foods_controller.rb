class FoodsController < ApplicationController
  before_action :set_menu
  before_action :set_food, only: [:show, :edit, :update]
  
  def index
  	@foods = Food.all
  end

  def show
  end

  def new
  	@food = @menu.foods.build
  end

  def create
  	@food = @menu.foods.build(food_params)

  	if @food.save!
  	  flash[:notice] = "Food item has been created."
  	  redirect_to [@menu, @food]
  	  #render "index"
  	else
  	  flash.now[:alert] = "Food item has not been created. "+ @food.name.to_s
  	  render "new" 
  	end
  end

  def edit
  end

  def update
    if @food.update(food_params)
      flash[:notice] = "Food has been updated."
      redirect_to [@menu, @food]
    else
      flash.now[:alert] = "Food has not been updated."
    end
  end

  private
    def set_menu
      @menu = Menu.find(params[:menu_id])
    end

    def set_food
      @food = @menu.foods.find(params[:id])
    end

    def food_params
      params.require(:food).permit(:name, :price, :image)
    end
end
