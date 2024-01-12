class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :user


  after_create :mark_room_as_booked

  private
    def mark_room_as_booked
      self.room.update(status: "Booked")
    end
end
