class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :nickname,     null: false
      t.string :explanation,  null: false
      t.string :category_id,  null: false
      t.string :condition_id, null: false
      t.string :postage_id,   null: false
      t.string :area_id,      null: false
      t.string :time_id,      null: false
      t.string :price,        null: false
      t.references :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
