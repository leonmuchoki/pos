class MenusController < ApplicationController
  def index
  	@menus = Menu.all
  	#@selected_menu_type_id = 
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
  	  flash.now[:alert] = "Menu type has not been created."
  	  render "new"
  	end
  end

  private
    def menu_params
      params.require(:menu).permit(:name)
    end
end
