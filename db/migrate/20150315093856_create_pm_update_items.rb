class CreatePmUpdateItems < ActiveRecord::Migration
  def change
    create_table :pm_update_items do |t|
      t.string :city
      t.integer :pm25
      t.references :pm_update, index: true

      t.timestamps null: false
    end
    add_foreign_key :pm_update_items, :pm_updates
  end
end
