class Student < ActiveRecord::Base
  belongs_to :country
  belongs_to :state
  belongs_to :city
  has_many :presenties
  has_many :lectures, :through => :presenties
  has_many :admissions
  has_many :grades, :through => :admissions
  has_and_belongs_to_many :batches
  has_and_belongs_to_many :exams
  has_many :attempts
  attr_accessible :address_line1, :address_line2, :alternate_mobile, :email, :enrollment_date, :first_name, :last_name, :middle_name, :mobile, :sponsor, :zip_code, :state_id, :city_id, :country_id, :photo, :ban, :date_of_birth, :address, :blindness, :user_id
  has_attached_file :photo  
  has_attached_file :address
  has_attached_file :blindness
  belongs_to :user
   validates :first_name, :last_name, :address_line1, :mobile, :enrollment_date, :zip_code,	:state_id, :city_id, :date_of_birth, :presence => true
  validates :first_name,  :last_name, :format => {:with => /\A[a-zA-z]+\z/, :message => "Only letters allowed."}
  validates :middle_name, :format => {:with => /\A[a-zA-z]+\z/, :message => "Only letters allowed."}, :allow_blank => true
  validates :email, :format => { :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i , :message => "Not a valid email address"}, :allow_blank => true
  validates :zip_code, :format => { :with => /^\d{6}$/, :message => "Please provide 6 digit pin code" }
  validates :mobile, :alternate_mobile, :format => { with: /(^\s*$|^\s*[789]\d{9}\s*$)/, :message => " Number should be start from 7, 8, or 9. " }
  #validates_attachment :photo, :presence => true, :content_type => { :content_type => ['image/jpg', 'image/png', 'image/jpeg']}
  #validates_attachment :address, :presence => true, :content_type => { :content_type => ['image/jpg', 'image/png', 'image/jpeg']}
  #validates_attachment :blindness, :presence => true, :content_type => { :content_type => ['image/jpg', 'image/png', 'image/jpeg']}
  validate :date
  def date
      if date_of_birth
      if date_of_birth >= Date.today
        errors.add(:date_of_birth, "Do not allow to enter future date.")
      elsif date_of_birth.year > Date.today.year - 10
        errors.add(:date_of_birth, "Please enter the 10 year before date.")
      
    end
end
end
end
