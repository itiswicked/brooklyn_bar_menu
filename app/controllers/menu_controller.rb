class MenuController < ApplicationController

  def new
    @data = read_static_data
    @bar_name = bar_name
    @menu = menu

  end

  def read_static_data
    File.open("static_data.yml", "r") do |f|
      YAML.load(f)
    end
  end

  def bar_name
    return "The #{street}" if percent_chance?(50)
    "#{street} & #{street}"
  end

  def street
    pull_word_from(@data["streets"])
  end

  def menu
    (1..10).map { full_menu_item }
  end

  def full_menu_item
    # Make three food item meal
    if percent_chance? 20
      if percent_chance? 50
        menu_item = one_food_item + ", " + one_food_item + " & " + one_food_item
      else
        menu_item = one_food_item + " with " + one_food_item + " & " + one_food_item
      end

    # Make two food item meal
    elsif percent_chance? 40
      if percent_chance? 50
        menu_item = one_food_item + " & " + one_food_item
      else
        menu_item = one_food_item + " with " + one_food_item
      end

    # one food item meal
    else
      menu_item = one_food_item
    end
    { title: menu_item, price: price }
  end

  def one_food_item
    food_item = ""
    food_item += pull_word_from(@data["streets"]) + " "  if percent_chance? 55
    food_item += pull_word_from(@data["foods"])
    food_item += " " + pull_word_from(@data["shapes"]) if percent_chance? 40
    food_item
  end

  def percent_chance?(num)
    num > rand(0..100)
  end

  def price
    (8 + rand(0..10)).to_s
  end

  def pull_word_from(array)
    array[rand(0..array.size-1)]
  end

end
