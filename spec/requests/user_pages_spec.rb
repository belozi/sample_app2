require 'spec_helper'

describe "UserPages" do

	subject {page}

	describe "profile page" do 
		let(:user) 	{ FactoryGirl.create(:user) }
		before { visit user_path(user) }

		it { should have_content(user.first_name) }
		it { should have_content(user.last_name) }
		it { should have_title("#{user.first_name} #{user.last_name}") }
	end

	describe "signup page" do
		before { visit signup_path }

		it { should have_content('Sign up') }
		it { should have_title (full_title('Sign up')) }
	end

	describe "signup page" do 
		before { visit signup_path }

		it { should have_content('Sign up') }
		it { should have_title('Sign up') }
	end

	describe "signup" do 

		before { visit signup_path }

		let(:submit) { "Create my account" }

		describe "with invalid information" do 
			it "should not create a user" do 
				expect { click_button submit }.not_to change(User, :count)
			end

			describe "after invalid information" do 
				before { click_button submit }

				it { should have_title('Sign up') }
				it { should have_selector('div.alert.alert-error', text: "The form contains 6 errors") }
			end
		end

		describe "with valid information" do 
			before do 
				fill_in "First name",			with: "Robert"
				fill_in "Last name", 			with: "Lee"
				fill_in "Email", 				with: "robert.belozi.lee@gmail.com"
				fill_in "Password",				with: "password"
				fill_in "Confirmation",			with: "password"
			end

			it "should create user" do 
				expect { click_button submit }.to change(User, :count).by(1)
			end

			describe "after saving the user" do 
				before { click_button submit }
				let(:user) { User.find_by(email: 'robert.belozi.lee@gmail.com') }

				it { should have_link('Sign out') }
				it { should have_title("#{user.first_name} #{user.last_name}") }
				it { should have_selector('div.alert.alert-success', text: 'Welcome to blittered!') }
			end
		end
	end
end
