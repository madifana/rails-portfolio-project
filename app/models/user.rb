require 'pry'
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :recipes
  has_many :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         :omniauth_providers => [:twitter, :facebook]


   def self.from_omniauth(auth)

     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
       user.name = auth.info.name
       user.email = "#{auth.info.name}@twitter.com"
       user.password = Devise.friendly_token[0,20]
     end
   end
end
