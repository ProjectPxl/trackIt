class AddFieldsToTables < ActiveRecord::Migration
  def change
    add_column :contracts, :user_id,    :integer
    add_column :contracts, :project_id, :integer
    add_column :contracts, :source_id,  :integer
  end
end
