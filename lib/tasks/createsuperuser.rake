# frozen_string_literal: true

def ask_email
  print "Superuser email: "
  gets.chomp
end

def ask_password
  print "Password: "
  password = STDIN.noecho(&:gets).chomp

  print "\nPassword confirmation: "
  password_confirmation = STDIN.noecho(&:gets).chomp

  until password == password_confirmation
    puts "\nPasswords do not match !"

    print "Password: "
    password = STDIN.noecho(&:gets).chomp

    print "\nPassword confirmation: "
    password_confirmation = STDIN.noecho(&:gets).chomp
  end

  password
end

desc "Create new super user with admin privileges"
task createsuperuser: :environment do
  email = ask_email
  password = ask_password

  User.create!(email: email, password: password, password_confirmation: password, role: 999999)
  puts "\nSuperuser \"#{email}\" created!"
end
