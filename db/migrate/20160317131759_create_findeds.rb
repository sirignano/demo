class CreateFindeds < ActiveRecord::Migration
  def change
    create_table :findeds do |t|
      t.string :name
      t.string :linkedin
      t.string :phone
      t.string :picture

      t.timestamps null: false
    end
  end
end
