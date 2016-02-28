class AddHaltedToUser < ActiveRecord::Migration
  def change
    add_column :users, :halted, :boolean
  end
end
