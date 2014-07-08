FactoryGirl.define do 
	factory :user do 
		sequence(:first_name)		{ |n| "Person"}
		sequence(:last_name)		{ |n| "Number#{n}" }
		sequence(:email)			{ |n| "person#{n}@example.com" }
		password "foobar"
		password_confirmation "foobar"

		factory :admin do 
			admin true
		end
	end
end