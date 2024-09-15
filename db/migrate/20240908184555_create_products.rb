class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :url
      t.string :title
      t.decimal :price
      t.datetime :published_at

      t.timestamps
    end
  end
end
