class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :image
      t.string :title
      t.string :capture
      t.string :price

      t.timestamps
    end
  end
end
