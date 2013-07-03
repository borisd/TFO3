class AddAnswerToRiddles < ActiveRecord::Migration
  def up
    add_column :riddles, :answer, :text
  end

  def down
    remove_column :riddles, :answer
  end
end
