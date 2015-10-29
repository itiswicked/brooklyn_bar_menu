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
    @data = data
    @bar_name = bar_name
    @menu_items = menu_items
    @menu = Menu.new
  end

  def create
    @bar_name = BarName.new
    @bar_name.name = bar_name
    if @bar_name.save
      new_menu = Menu.new
      new_menu.bar_name_id = @bar_name.id
      if new_menu.save
        menu_items.each do |menu_item|
          MenuItem.create(menu_id: new_menu.id,
                             item: menu_item[:title],
                            price: menu_item[:price])
        end
        redirect_to menu_path(new_menu)
      else
        # redirect_to menu_path(last_menu)
        redirect_to menus_path
      end
    else
      redirect_to menus_path
    end
  end

  def data
    File.open("static_data.yml", "r") { |f| YAML.load(f) }
  end

  def bar_name
    return "The #{street}" if percent_chance?(50)
    "#{street} & #{street}"
  end

  def street
    pull_word_from(data["streets"])
  end

  def menu_items
    (1..10).map { { title: menu_item, price: price } }
  end

  def menu_item
    if percent_chance? 20 # Make three food item meal
      percent_chance?(50) ? three_food_item(", ") : three_food_item(" & ")
    elsif percent_chance? 40 # Make two food item meal
      percent_chance?(50) ? two_food_item(" & ") : two_food_item(" with ")
    else # one food item meal
      one_food_item
    end
  end

  def three_food_item(coupler)
    one_food_item + "#{coupler}" + one_food_item + " with " + one_food_item
  end

  def two_food_item(coupler)
    one_food_item + "#{coupler}" + one_food_item
  end

  def one_food_item
    adjective + food + shape
  end

  def adjective
    percent_chance?(55) ? pull_word_from(data["adjectives"]) + " " : ""
  end

  def food
    pull_word_from(data["foods"])
  end

  def shape
    percent_chance?(40) ? " " + pull_word_from(data["shapes"]) : ""
  end

  def percent_chance?(num)
    num > rand(0..100)
  end

  def price
    (8 + rand(0..10))
  end

  def pull_word_from(array)
    array[rand(0..array.size-1)]
  end

end
