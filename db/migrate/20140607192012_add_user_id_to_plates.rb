class AddUserIdToPlates < ActiveRecord::Migration
  def change
    add_reference :plates, :user, index: true
  end
end
