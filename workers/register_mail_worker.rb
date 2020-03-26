require 'shoryuken'
require_relative '../config/environment'

require_relative 'email_sender_middleware'

class RegisterMailWorker
    include Shoryuken::Worker

    shoryuken_options queue: 'send_email', auto_delete: true

    def perform(_sqs_msg, user_id)
        user = User.find(user_id)
        if user
            puts "Sending email to #{user.email}..."
            EmailSender.email_sender(user)
        else
            puts "Task failed"
        end
    end
end
