class DrinksController < ApplicationController
  before_action :set_menu
  before_action :set_drink, only: [:show, :edit, :update]

  def show
  end

  def new
  	@drink = @menu.drinks.build
  end

  def create
  	@drink = @menu.drinks.build(drink_params)

  	if @drink.save!
  	  flash[:notice] = "Drink item has been created."
  	  redirect_to [@menu, @drink]
  	  #render "index"
  	else
  	  flash.now[:alert] = "Drink item has not been created. "
  	  render "new" 
  	end
  end

  def edit
  end

  def update
    if @drink.update(drink_params)
      flash[:notice] = "Drink has been updated."
      redirect_to [@menu, @drink]
    else
      flash.now[:alert] = "Drink has not been updated."
    end
  end

  private
    def set_menu
      @menu = Menu.find(params[:menu_id])
    end

    def set_drink
      @drink = @menu.drinks.find(params[:id])
    end

    def drink_params
      params.require(:drink).permit(:name, :price, :image)
    end
end
