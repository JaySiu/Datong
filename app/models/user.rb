class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :fname, presence: true
  validates :lname, presence: true
  
  validates :img_url, presence: true
  validates :blurb, presence: true
  
  def fullname
    return fname + ' ' + lname
  end

end
