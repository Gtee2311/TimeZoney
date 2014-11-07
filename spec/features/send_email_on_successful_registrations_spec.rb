require 'rails_helper'

feature "SendEmailOnSuccessfulRegistrations", :type => :feature do
  feature "When User successfully registers" do
      
      #let(:user) { build(:user) }
      scenario "User count should increment by 1" do
          user_count = User.count # should be 0
          visit 'sign_up'
          fill_in "Name", with: "Grace23"
          fill_in "Email", with: "gracey@gmail.com"
          fill_in "Password", with: "password"
          fill_in "Password confirmation", with: "password"
          puts User.all
          click_on "Sign Up"
          expect(User.count).to eq(user_count + 1)
      end
  end
end
