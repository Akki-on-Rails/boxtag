class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_collections
  has_many :collections, through: :user_collections
  has_many :boxes, through: :collections
  has_many :items, through: :boxes

  has_one_attached :avatar
end
