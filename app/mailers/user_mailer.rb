class UserMailer < ActionMailer::Base

  default from: 'Alternative Breaks'

  def post_created_email(users, post)
    @post = post
    poster = post.user.name
    users = users.map { |u| "#{u.name} <#{u.email}>" }
    mail(
      to: users,
      subject: "New post from #{poster}"
    ) if users
  end
end