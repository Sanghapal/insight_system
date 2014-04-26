if Rails.env.development?
  ActionMailer::Base.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                 587,
    domain:               'insightmanagment.com',
    user_name:            'insightpertal@gmail.com',
    password:             'namv@1234@insight',
    authentication:       'plain',
    enable_starttls_auto: true }
end
