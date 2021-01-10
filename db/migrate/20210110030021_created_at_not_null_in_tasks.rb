class CreatedAtNotNullInTasks < ActiveRecord::Migration[6.1]
  def change
    change_column_null :tasks, :done_at, false, DateTime.now
  end
end
