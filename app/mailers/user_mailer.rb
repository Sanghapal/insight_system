class UserMailer < ActionMailer::Base
  def admin(user, request)
    @user = user
    @request = request
mail(:from => "insightpertal@gmail.com", :to => @user, :subject => 'Trainers request', :template_path => 'user_mailer', :template_name => 'admin')
  end
  def examreport(user, r)
    @user = user
    @result = r
    mail(:from => "insightpertal@gmail.com", :to => @user, :subject => 'Exam Report.', :template_path => 'user_mailer', :template_name => 'examreport')
  end
end
