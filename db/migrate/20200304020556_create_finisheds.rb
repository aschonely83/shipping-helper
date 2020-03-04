class CreateFinisheds < ActiveRecord::Migration[6.0]
  def change
    create_table :finisheds do |t|
      t.string :product
      t.integer :quantity
      t.integer :user_id
      t.integer :retailer_id

      t.timestamps
    end
  end
end
