class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable

  validates :first_name, presence: true
  validates :last_name, presence: true
    
  def full_name
    fullname = "#{first_name}, #{last_name}"
  end

  #only needed if not using Devise
  #has_secure_password

end
