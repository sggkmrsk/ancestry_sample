class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :category,null: false, foreign_key: true
      t.timestamps
    end
  end
end