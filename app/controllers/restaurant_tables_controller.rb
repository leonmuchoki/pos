class RestaurantTablesController < ApplicationController
  def new
  	@rtable = RestaurantTable.new
  end

  def create
  	@rtable = RestaurantTable.new(rtable_params)
  end

  private
    def rtable_params
      params.require(:restauranttable).permit(:table_no, :accomodates)
    end
end
