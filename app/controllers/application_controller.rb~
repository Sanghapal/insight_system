class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  protect_from_forgery
  #before_filter :authenticate_user!
  def after_sign_in_path_for(resource)
p 'Session is,'
p session
    if resource && session[:user_return_to]
    new_user_invitation_path
elsif resource && resource.sign_in_count == 1 && resource.roles == 'trainer'
      new_trainer_path
elsif resource && resource.sign_in_count == 1 && resource.roles == 'student'
  new_student_path
else
      welcome_path
  end
  end
def load_country_state_city
@countries  = Country.find(:all, :order => "name ASC")
    #@states = State.all.order_by([:name, :asc])

@states=  State.find(:all, :order => "name ASC")

    #@cities = City.all.order_by([:name, :asc])
@cities = City.find(:all, :order => "name ASC")


  end	    
end
