class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :name
      t.string :tel
      t.string :major
      t.integer :gender
      t.string :email
      t.integer :campus
      t.string :forum_id

      t.integer :groups
      # t.boolean :tg
      # t.boolean :og
      # t.boolean :cg
      # t.boolean :pg

      t.text :q1
      t.text :q2
      t.text :q3
      t.text :q4

      t.string :cookie_hash

      t.text :comments
      t.integer :state
      t.boolean :spam, :null => false, :default => false

      t.timestamps
    end
  end
end
