class Menu < ActiveRecord::Base
  belongs_to :bar_name
  has_many :menu_items
end
