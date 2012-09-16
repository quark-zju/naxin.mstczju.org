class AddIndexesToFormsAndActiveAdminComments < ActiveRecord::Migration
  def change
    add_index :forms, [:spam, :id]
    add_index :active_admin_comments, [:resource_type, :resource_id, :namespace]
  end
end
