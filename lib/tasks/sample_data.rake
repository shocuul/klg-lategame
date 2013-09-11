namespace :db do 
	desc "Fill database with sample data"
	task populate: :environment do
		User.create!(name: "Jose David",
					email: "josepdark@gmail.com",
					password: "online",
					password_confirmation: "online",
					admin: true)

		99.times do |n|
			name = Faker::Name.name
			email = "Example-#{n+1}@lategame.net"
			password = "password"
			User.create!(name: name,
						email: email,
						password: password,
						password_confirmation: password)
		end
	end
end