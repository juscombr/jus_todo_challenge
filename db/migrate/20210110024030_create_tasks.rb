class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.datetime :done_at, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :updated_at
      t.datetime :deleted_at
    end
  end
end
