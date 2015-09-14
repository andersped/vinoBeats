require "rails_helper" #this will put in capybara

	feature "Root directory has a title" do 
		scenario 'A user can go to the root directory' do 
			visit root_path

			expect(page).to have_content("VinoBeats")
		end
	end



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

	feature "Add User" do
		before do

			visit "/signup"
				secenario "Fill out form and add user" do
					fill_in "name", with: 'username'
					fill_in "email", with: 'test@test.com'
					fill_in "password", with: "password"

					click_button "submit-user"
				end
			end

end


