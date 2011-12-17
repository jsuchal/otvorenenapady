class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :message
      t.string :url
      t.date :published_at
      t.date :valid_from
      t.date :valid_to
      t.string :location_label
      t.string :category
      t.float :lat
      t.float :lng
      t.integer :detailed_id
      t.string :detailed_type
    end
  end
end
