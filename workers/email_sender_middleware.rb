require_relative '../config/pony'

class EmailSender
    def self.email_sender(user)
        body = "<body><h1> Hi #{user.username}!!</h1>"\
        '<h3>Welcome to my Recipes app.</h3>'\
        '<h4>Click here to <a href="https://my-recipe-sinatra.herokuapp.com/users/login">login</a></h4>'\
        '</body>'
        Pony.mail(to: user.email, subject: 'Registration successful', html_body: body)
    end
end
