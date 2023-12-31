class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :code, index: { unique: true }
      t.string :name
      t.decimal :price, precision: 6, scale: 2
      
      t.timestamps
    end
  end
end
