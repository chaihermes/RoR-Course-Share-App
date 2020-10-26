class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #Relação das tabelas
  has_many :avaliations, dependent: :destroy
  has_many :courses, through: :avaliations
end
