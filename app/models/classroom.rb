class Classroom < ApplicationRecord
  has_many :reviews

  def self.search(search, classroom_or_club)
    if classroom_or_club == "1"
      Classroom.where(['name LIKE ?', "%#{search}%"])
    else
      Classroom.all
    end
  end
end