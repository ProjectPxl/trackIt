class AddNoteToHours < ActiveRecord::Migration
  def change
    add_column :hours, :note, :string
  end
end
