class DrinksController < ApplicationController
  before_action :set_menu

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

  private
    def set_menu
      @menu = Menu.find(params[:menu_id])
    end

    def drink_params
      params.require(:drink).permit(:name, :price, :image)
    end
end
