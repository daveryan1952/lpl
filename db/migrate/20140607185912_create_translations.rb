class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.string :meaning
      t.string :status_code, :default => "A"
      t.integer :votes, :default => 1
      t.timestamps
    end
  end
end
