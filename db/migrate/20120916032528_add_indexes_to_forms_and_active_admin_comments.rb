class AddIndexesToFormsAndActiveAdminComments < ActiveRecord::Migration
  def change
    add_index :forms, [:spam, :id], order: { spam: :asc, id: :desc }
    add_index :active_admin_comments, [:resource_type, :resource_id, :namespace], name: 'index_res_and_ns'
  end
end
