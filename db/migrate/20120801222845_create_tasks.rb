class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :list_id
      t.string :description

      t.timestamps
    end

    add_index :tasks, :list_id
  end
end
