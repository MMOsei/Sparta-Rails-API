class CreateLovecrafts < ActiveRecord::Migration[5.2]
  def change
    create_table :lovecrafts do |t|
      t.string :deity
      t.string :tome
      t.string :location
      t.string :word
      t.string :sentence

      t.timestamps
    end
  end
end
