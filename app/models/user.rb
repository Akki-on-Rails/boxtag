class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # belongs_to :user_collection
  # to sign up as a new user we need a default collection that
  # is linked when creating the new user.
  has_one_attached :avatar
end
