class AddPictureToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :picture, :binary
  end
end
