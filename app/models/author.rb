class Author < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable :registerable,
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :posts
  
  
  
end
