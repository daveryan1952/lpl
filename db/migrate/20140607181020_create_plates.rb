class CreatePlates < ActiveRecord::Migration
  def change
    create_table :plates do |t|
      t.string :plate_number
      t.string :plate_image
      t.string :state
      t.string :status_code, :default => "A"
      t.integer :rated_count, :default => 0
      t.decimal :rating, precision: 5, scale: 2, :default => 0
      t.integer :translation_votes, :default => 0
      t.timestamps
    end
  end
end
