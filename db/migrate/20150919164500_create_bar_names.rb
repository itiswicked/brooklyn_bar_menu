class CreateBarNames < ActiveRecord::Migration
  def change
    create_table :bar_names do |t|
      t.belongs_to :menu
      t.string :name
    end
  end
end
