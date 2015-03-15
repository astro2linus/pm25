class CreatePmUpdates < ActiveRecord::Migration
  def change
    create_table :pm_updates do |t|

      t.timestamps null: false
    end
  end
end
