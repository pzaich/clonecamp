class RemoveUserIdFromProject < ActiveRecord::Migration
  def up
    remove_column :projects, :user_id
  end

  def down
    add_column :projects, :user_id, :integer
  end
end
