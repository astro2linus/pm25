class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :chinese_name
      t.string :english_name

      t.timestamps null: false
    end
  end
end
