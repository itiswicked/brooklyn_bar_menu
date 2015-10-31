class MenuItem < ActiveRecord::Base
  belongs_to :menu

  def make_item
    item ||= three_food_item if percent_chance?(20)
    item ||= two_food_item   if percent_chance?(40)
    item ||= one_food_item
  end

  def make_price
    price ||= (8 + rand(0..10))
  end

  private

    def data
      File.open("static_data.yml", "r") { |f| YAML.load(f) }.symbolize_keys
    end

    def three_food_item
      percent_chance?(50) ? three_item_string(", ") : three_item_string(" & ")
    end

    def two_food_item
      percent_chance?(50) ? two_item_string(" & ") : two_item_string(" with ")
    end

    def three_item_string(coupler)
      "#{one_food_item}#{coupler}#{one_food_item} with #{one_food_item}"
    end

    def two_item_string(coupler)
      "#{one_food_item}#{coupler}#{one_food_item}"
    end

    def one_food_item
      "#{adjective}#{food}#{shape}"
    end

    def food
      pull_word_from(:foods)
    end

    def adjective
      "#{pull_word_from(:adjectives)} " if percent_chance?(55)
    end

    def shape
      " #{pull_word_from(:shapes)}" if percent_chance?(40)
    end

    def pull_word_from(key)
      data[key].sample
    end

    def percent_chance?(num)
      num > rand(0..100)
    end

end
