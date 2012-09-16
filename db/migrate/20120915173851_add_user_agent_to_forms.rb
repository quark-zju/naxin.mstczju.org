class AddUserAgentToForms < ActiveRecord::Migration
  def change
    add_column :forms, :user_agent, :string
  end
end
