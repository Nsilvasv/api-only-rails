class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.references :owner_id, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
