require_relative '../config/pony'

class EmailSender
    def self.email_sender(user)
        body = "<body><h1> Hi #{user.username}!!</h1>"\
        '<h3>Welcome to Personal Notes app.</h3>'\
        '<h4>Glad to make you part of my team lol</h4>'\
        '</body>'
        Pony.mail(to: user.email, subject: 'Registration successful', html_body: body)
    end
end
