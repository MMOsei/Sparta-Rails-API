class CreateCaffeines < ActiveRecord::Migration[5.2]
  def change
    create_table :caffeines do |t|
      t.string :blend_name
      t.string :origin
      t.string :variety
      t.string :notes
      t.string :intensifier

      t.timestamps
    end
  end
end
