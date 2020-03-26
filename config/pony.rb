require 'pony'

Pony.options = {
  from: ENV['EMAIL_FROM'],
  via: :smtp,
  via_options: {
    address: 'smtp.gmail.com',
    port: '587',
    user_name: ENV['USERNAME'],
    password: ENV['PASSWORD'],
    authentication: :plain,
    domain: 'mail.google.com',
    enable_starttls_auto: 'true'
  }
}
