class ApplicationMailer < ActionMailer::Base
  default from: "miles@ofito.cc"
  default_url_options[:host] = "miles@ofito.cc"
  layout "mailer"
end
