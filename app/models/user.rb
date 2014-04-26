class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :trainer
  has_one :student
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :roles
  # attr_accessible :title, :body
  def send_confirmation_instructions
    super
    self.confirmation_token = nil    # clear's the confirmation_token
    self.confirmed_at = Time.now.utc # confirm's the user
    self.save
  end

end
