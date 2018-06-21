class CaffeineId < ActiveRecord::Migration[5.2]
  def change
    add_column :lovecrafts, :caffeine_id, :integer
  end
end
