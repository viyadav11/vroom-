class MailerJob < ApplicationJob
  queue_as :default
  def perform(article)
    byebug
    WelcomeNotiMailer.create_notification(article).
    deliver_now
  end
  private
  def perform_viyadav
    WelcomeNotiMailer.upd_notification.
    deliver_now
  end
  def perform_shvyas(article)
    WelcomeNotiMailer.upd_notification(article).
    deliver_now
  end
end
