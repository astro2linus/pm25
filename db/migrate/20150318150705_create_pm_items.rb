class CreatePmItems < ActiveRecord::Migration
  def change
    create_table :pm_items do |t|
      t.integer :pm25
      t.references :city, index: true

      t.timestamps null: false
    end
    add_foreign_key :pm_items, :cities
  end
end
