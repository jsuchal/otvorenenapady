class CreateDetailedTables < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :address
      t.string :website
    end
  end
end
