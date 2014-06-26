require 'spec_helper'

describe "StaticPages" do

	let(:base_title) {"blittered"}

	describe "Home page" do 

		it "should have the content 'blittered'" do
			visit '/static_pages/home'
			expect(page).to have_content('blittered')
	    end

	    it "should have the title 'Home'" do 
	    	visit '/static_pages/home'
	    	expect(page).to have_title("#{base_title}")
	    end

	    it "should not have custom page title" do
	    	visit '/static_pages/home'
	    	expect(page).not_to have_title('| Home')
	    end
	end

	describe "Help page" do

		it "should have content 'Help'" do
			visit '/static_pages/help'
			expect(page).to have_content('Help')
		end

		it "should have the title 'Help'" do 
			visit '/static_pages/help'
			expect(page).to have_title("#{base_title} | Help")
		end
	end

	describe "About page" do

		it "should have content 'About Us'" do
			visit '/static_pages/about'
			expect(page).to have_content('About Us')
		end

		it "should have the title 'About Us" do 
			visit '/static_pages/about'
			expect(page).to have_title("#{base_title} | About Us")
		end
	end

	describe "Contact page" do

		it "should have the content 'Contact'" do 
			visit '/static_pages/contact'
			expect(page).to have_content('Contact')
		end

		it "should have title 'Contact'" do
			visit '/static_pages/contact'
			expect(page).to have_title("#{base_title} | Contact")
		end
	end
end