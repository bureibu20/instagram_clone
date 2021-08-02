class FeedMailer < ApplicationMailer
  def feed_mail(feed)
    @feed = feed
    mail to: "bureibu20@gmail.com", subject: "投稿の確認メール"
  end
end
