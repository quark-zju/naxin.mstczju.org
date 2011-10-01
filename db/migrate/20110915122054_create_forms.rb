class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :name
      t.string :tel
      t.string :major
      t.integer :gender
      t.string :email
      t.string :forum_id
      t.boolean :og
      t.boolean :cg
      t.boolean :pg
      t.text :self_intro
      t.text :fav_soft
      t.text :mstc_opinion
      t.text :other
      t.text :comments

      t.timestamps
    end
  end
end
