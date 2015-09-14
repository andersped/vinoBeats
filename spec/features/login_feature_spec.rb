require 'rails_helper'

	feature "Login" do
		before do
		
		# Visit the login page 
		visit "/login"
			scenario "A user can login" do

				fill_in "email", with: 'Test@test.com'
				fill_in "password", with: 'password'

				click_button "submit-user"
		end
	end
end