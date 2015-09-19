class Menu < ActiveRecord::Base
  has_many :bar_names
  has_many :menu_items
end
