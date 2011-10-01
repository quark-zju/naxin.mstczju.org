class AddFormHash < ActiveRecord::Migration
  def change
    change_table :forms do |t|
      t.string :cookie_hash
    end
  end
end
