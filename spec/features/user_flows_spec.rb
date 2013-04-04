require 'spec_helper'

describe "UserFlows" do  
	subject { page }
  describe "signup page" do
    before { visit new_user_path}
	  let (:submit_button){ "Create" }
  	let (:user){ User.create name: Faker::Name.name, 
  													email: Faker::Internet.email, 
  													password: Faker::Lorem.word}

  	it { should have_content "Sign" }
  	
    context "valid submission" do
  		
      before do 
  			fill_in "Name", :with => "Matthew"
  			fill_in "Email", :with => "matthew@rocks.com"
  			fill_in "Password", :with => "Tester1"
  		end

  		it "creates a new user" do
  			expect{ click_button submit_button }.to change(User, :count).by(1)
  		end

  		it "redirects to the user profile page" do
  			click_button submit_button
  			current_path.should eq(user_path(User.last))
  		end

      it "has no errors" do
        click_button submit_button
        should_not have_selector("div.errors")
      end
  	end

  	context "invalid submission" do
  		before do 
  			fill_in "Name", :with => "Matthew"
  			fill_in "Email", :with => "matthew@rockscom"
  			fill_in "Password", :with => ""
  		end

  		it "doesn't create a new user" do
  			expect{ click_button submit_button }.not_to change(User, :count)
  		end

  		describe "after submit" do
  			before { click_button submit_button }

  			it { should have_selector "div.errors" }
  			it { should_not have_content "Welcome" }
  			it "stays on the users/new page" do
  				current_path.should eq(new_user_path)
  			end
  		end
  	end
  end

	describe "users index page" do
		before { visit users_path }
    
		it { should have_content "Users" }
	end  

	describe "user profile page" do
		let (:u){ FactoryGirl.create(:user) }
		before{ login(u) }

		it { should have_content "Welcome" }
	end


  describe "logout" do
    let (:u){ FactoryGirl.create(:user) }
    before do
      login(u)
      visit user_path(u.id)
      click_on "logout"
    end

    it { should_not have_content "user!" }
  end
end
