class CreateWhishlsits < ActiveRecord::Migration
  def change
    create_table :whishlsits do |t|
      t.integer :product_id
      t.integer :user_id

      t.timestamps
    end
  end
end
