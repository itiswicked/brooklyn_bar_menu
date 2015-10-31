class MenusController < ApplicationController

  def index
    @menus = Menu.all
    @bars = BarName.all
  end

  def show
    @menu = Menu.find(params[:id])
    @bar_name = BarName.find_by(id: @menu.bar_name_id)
    @menu_items = MenuItem.where(menu_id: @menu.id)
  end

  def new
    @bar_name = BarName.new
    @menu_items = Array.new(10) { MenuItem.new }
  end

  def create
    @bar_name = BarName.new
    @bar_name.name = @bar_name.make_name
    if @bar_name.save
      @menu = Menu.new
      @menu.bar_name_id = @bar_name.id
      if @menu.save
        10.times do
          menu_item = MenuItem.new(menu_id: @menu.id)
          menu_item.item  = menu_item.make_item
          menu_item.price = menu_item.make_price
          menu_item.save
        end
        redirect_to menu_path(@menu)
      else
        # redirect_to menu_path(last_menu)
        redirect_to menus_path
      end
    else
      redirect_to menus_path
    end
  end

end
