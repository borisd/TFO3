class AddRiddles < ActiveRecord::Migration
  def up
    create_table :riddles do |t|
      t.string :name
      t.text :details
    end
  end

  def down
    drop_table :riddles
  end
end
