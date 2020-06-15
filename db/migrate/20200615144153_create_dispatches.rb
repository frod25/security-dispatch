class CreateDispatches < ActiveRecord::Migration[6.0]
  def change
    create_table :dispatches do |t|
      t.string :title
      t.text :description
      t.string :url
      t.integer :user_id

      t.timestamps
    end
  end
end
