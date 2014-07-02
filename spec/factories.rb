FactoryGirl.define do 
	factory :user do 
		first_name				"Robert"
		last_name				"Lee"
		email					"robert.belozi.lee@gmail.com"
		password				"password"
		password_confirmation 	"password"
	end
end