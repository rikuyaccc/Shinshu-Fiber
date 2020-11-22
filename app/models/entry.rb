class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :room

  #Room一部屋に一意のユーザしか入らないバリデーション
  validates :room_id, uniqueness: { scope: :user_id }
end
