class CreateSubscription < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :title
      t.integer :price
      t.integer :status, default: 'active'
      t.integer :frequency
    end
  end
end
