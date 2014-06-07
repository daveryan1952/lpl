class AddPlateIdToTranslations < ActiveRecord::Migration
  def change
    add_reference :translations, :plate, index: true
  end
end
