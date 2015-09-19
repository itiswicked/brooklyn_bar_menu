class ChangeMenusToBelongToBar < ActiveRecord::Migration
  def change
    add_column :menus, :bar_id, :integer
    add_column :bar_names, :created_at, :timestamp
    add_column :bar_names, :updated_at, :timestamp

    remove_column :bar_names, :menu_id, :integer
  end
end
