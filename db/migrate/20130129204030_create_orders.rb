class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.string :type
      t.text :ingredients

      t.timestamps
    end
  end
end
