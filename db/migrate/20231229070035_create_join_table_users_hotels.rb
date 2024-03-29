class CreateJoinTableUsersHotels < ActiveRecord::Migration[7.1]
  def change
    create_join_table :users, :hotels do |t|
      t.index [:user_id, :hotel_id]
      t.index [:hotel_id, :user_id]
    end
  end
end
