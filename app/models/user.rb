class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true
  validates :firtname, presence: true
  validates :lastname, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }

  def self.authenticate_with_credentials(email, password) 
    user = User.where('lower(email) = ?', email.strip.downcase).first 
    if user && user.authenticate(password) 
      return user
    else 
      return nil  
    end
  end

end
