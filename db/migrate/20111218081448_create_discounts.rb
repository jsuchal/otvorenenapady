# encoding: utf-8
class CreateDiscounts < ActiveRecord::Migration
  def up
    add_column :events, :image_path, :string
    execute "UPDATE events SET image_path = '/discounts/celulitida.jpeg' where title = 'Zľava: Odtučnovacia kúra'"
    execute "UPDATE events SET image_path = '/discounts/kolagen.jpeg' where title = 'Zľava: Kolagénová terapia'"
    execute "UPDATE events SET image_path = '/discounts/zumba.jpeg' where title = 'Zľava: Zumba'"
  end

  def down
    remove_column :events, :image_path
  end
end