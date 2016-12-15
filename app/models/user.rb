class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true   
  mount_uploader :photo, PhotoUploader
  
  has_many :reviews
  
  def reviewed?(movie)
    return true if reviews.exists?(movie_id: movie.id)
  end 
  
end
