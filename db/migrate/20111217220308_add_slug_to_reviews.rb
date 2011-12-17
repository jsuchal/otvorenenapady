# encoding: utf-8
class AddSlugToReviews < ActiveRecord::Migration
  def up
    add_column :reviews, :slug, :string
    execute "UPDATE reviews SET slug = 'alibaba' WHERE name = 'Alibaba'"
    execute "UPDATE reviews SET slug = 'amelia' WHERE name = 'Amélia'"
    execute "UPDATE reviews SET slug = 'deliverix' WHERE name = 'DeliveriX'"
    execute "UPDATE reviews SET slug = 'aura' WHERE name = 'AURA'"
    execute "UPDATE reviews SET slug = 'bastion_koliba' WHERE name = 'Bastion Koliba'"
    execute "UPDATE reviews SET slug = 'belavijo' WHERE name = 'Belavijo'"
    execute "UPDATE reviews SET slug = 'casa_della_pizza' WHERE name = 'Casa Della Pizza & Grill'"
    execute "UPDATE reviews SET slug = 'greencafe' WHERE name = 'Greencafé'"
    execute "UPDATE reviews SET slug = 'la_martine' WHERE name = 'La Martiné'"
    execute "UPDATE reviews SET slug = 'palacinkaren_mexiko' WHERE name = 'Palacinkáreň Mexiko'"
    execute "UPDATE reviews SET slug = 'riviera' WHERE name = 'Restaurant Riviera'"
    execute "UPDATE reviews SET slug = 'subway_cubicon' WHERE name = 'SUBWAY - Cubicon'"
  end

  def down
    remove_column :reviews, :slug
  end
end
