class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|

      t.timestamps null: false
    end
  end
end
