class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  mount_uploader :image, ImageUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #自分がフォローしているユーザとの関連
  has_many :active_relationships, class_name: 'Relationship', foreign_key: :following_id, dependent: :destroy
  has_many :followings, through: :active_relationships, source: :follower

  #自分がフォローされているユーザとの関連
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: :follower_id, dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :following

  has_many :reviews, dependent: :destroy
  
  #DM機能のアソシエーション
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :rooms, through: :entries

  #ゲストユーザーが存在しなければユーザーを作成する
  def self.guest
    find_or_create_by(email: 'guest@example.com', username: 'ゲストユーザー') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
  #ユーザーがフォローされているか
  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end
end

