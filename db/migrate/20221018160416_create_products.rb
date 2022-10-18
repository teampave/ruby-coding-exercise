class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :additional_details, null: false
      t.integer :cost_cents, null: false
      t.integer :quantity_in_stock, null: false, default: 0

      t.timestamps
    end
  end
end
