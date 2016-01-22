class CreateHours < ActiveRecord::Migration
  def change
    create_table :hours do |t|
      t.column :user_id,    :integer
      t.column :project_id, :integer
      t.column :hours, :integer, limit: 24
      t.timestamps null: false
    end
  end
end
