namespace :db do 
	desc "Fill database with sample data"
	task populate: :environment do 
		User.create!(first_name: "Robert",
						last_name: "Lee",
						email: "robert.belozi.lee@gmail.com",
						password: "password",
						password_confirmation: "password",
						admin: true)
		99.times do |n|
			first_name = Faker::Name.first_name
			last_name = Faker::Name.last_name
			email = "example-#{n+1}@railstutorial.org"
			password = "password"
			User.create!(first_name: first_name,
							last_name: last_name,
							email: email,
							password: password,
							password_confirmation: password)
		end

		users = User.all(limit: 6)
		50.times do
			content = Faker::Lorem.paragraph(5)
			users.each	{ |user| user.microposts.create!(content: content) }
		end
	end
end