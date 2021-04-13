class CreateSubscriptions < ActiveRecord::Migration[5.2]
    def change
        create_table :subscriptions do |t|
            t.belongs_to :reader
            t.belongs_to :magazine
            t.integer :price
        end
    end
end
