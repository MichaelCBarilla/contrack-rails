class RemoveUserIdFromTasks < ActiveRecord::Migration[7.1]
  def up
    remove_column :tasks, :user_id

    # Check if the index exists before removing it
    if index_exists?(:tasks, :user_id)
      remove_index :tasks, :user_id
    end

    # Check if the foreign key exists before removing it
    foreign_key_exists = foreign_key_exists?(:tasks, :user_id)
    if foreign_key_exists
      remove_foreign_key :tasks, :users
    end
  end

  def down
    # If you need to rollback, you can recreate the column and its constraints
    add_column :tasks, :user_id, :integer
    add_foreign_key :tasks, :users, column: :user_id
    add_index :tasks, :user_id
  end
end
