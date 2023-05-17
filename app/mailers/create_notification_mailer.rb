class CreateNotificationMailer < ApplicationMailer
  def create_notification(object)
    
    @object= object

    mail to: "#{object.title}@bestpeers.com" , subject: "A new entry for the #{object.class} has been created"
  end

end
