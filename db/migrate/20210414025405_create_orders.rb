class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :currency
      t.string :first_name
      t.string :last_name
      t.decimal :gross_amount
      t.decimal :discount_amount
      t.decimal :net_amount
      t.integer :category_id

      t.timestamps
    end
  end
end
