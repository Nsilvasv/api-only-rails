class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.references :project, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.date :due_date
      t.integer :priority
      t.boolean :completed
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
