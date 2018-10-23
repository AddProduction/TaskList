class AddStatusToTaskLists < ActiveRecord::Migration[5.2]
  def change
    add_column :task_lists, :status, :string
  end
end
