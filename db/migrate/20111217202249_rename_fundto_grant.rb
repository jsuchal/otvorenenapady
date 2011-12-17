class RenameFundtoGrant < ActiveRecord::Migration
  def up
    execute "UPDATE events SET category = 'Grant' WHERE category = 'Fund'"
  end


  def down
  end
end
