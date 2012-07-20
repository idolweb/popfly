class PlaceholderTable < ActiveRecord::Migration
  def change
    create_table :placeholder do |t|
      t.string :slot1
    end
  end
end
