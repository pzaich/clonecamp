class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :access_level
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end

    add_index :roles, [:user_id, :project_id]
  end
end
