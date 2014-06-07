class AddUserIdToTranslations < ActiveRecord::Migration
  def change
    add_reference :translations, :user, index: true
  end
end
