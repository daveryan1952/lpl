class Notifier < ActionMailer::Base
  from_address = ActionMailer::Base.smtp_settings[:user_name]
  default from: "License Plate Lingo <#{from_address}>"
  
#  def comment_updated(comment, user)
#    @comment = comment
#    @user = user
#    @post = comment.post
#    subject = "[blogeeDAR] #{@post.title}"
#    mail(:to => user.email, :subject => subject)
#  end
end
