class AddRoleToLusers < ActiveRecord::Migration[7.0]
  def change
    add_column :lusers, :role, :integer, default: 0
  end
end
