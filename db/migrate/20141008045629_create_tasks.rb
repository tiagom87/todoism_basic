class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :content
      t.string :state

      t.timestamps null: false
    end
  end
end
