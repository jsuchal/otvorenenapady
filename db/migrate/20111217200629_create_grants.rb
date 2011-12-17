class CreateGrants < ActiveRecord::Migration
  def change
    create_table :grants do |t|
      t.integer :budget
      t.string :subject
    end
  end
end
