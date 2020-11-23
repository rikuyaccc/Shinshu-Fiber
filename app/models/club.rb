class Club < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :profile, presence: true
end
