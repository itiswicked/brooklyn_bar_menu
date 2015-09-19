class ChangeBarIdToBarNameId < ActiveRecord::Migration
  def change
    rename_column :menus, :bar_id, :bar_name_id
  end
end
