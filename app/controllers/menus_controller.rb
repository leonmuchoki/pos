class MenusController < ApplicationController
  def index
  end

  def show
  	@menu = Menu.find(params[:id])
  end

  def new
  	@menu = Menu.new
  end

  def create
  	@menu = Menu.new(menu_params)

  	if @menu.save
  	  flash[:notice] = "Menu type added successfully."
  	  redirect_to @menu 
  	else
  	  #will add error handler here
  	end
  end

  private
    def menu_params
      params.require(:menu).permit(:name)
    end
end