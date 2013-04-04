require 'spec_helper'


describe User do
	let(:user) { User.create :name => Faker::Name.first_name, 
																:email => Faker::Internet.email,
																:password => Faker::Lorem.word }

	it { should validate_uniqueness_of :email }
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :password_digest }

  it { should_not allow_value("blah").for(:email) }
  it { should allow_value("a@b.com").for(:email) }
  # it { should_not allow_mass_assignment_of(:password) }

  context "invalid user info" do
  	let(:invalid_user) { User.new name: "J", email: "j@lift", password: "" }

  	it "should not be valid" do
  		invalid_user.should_not be_valid
  	end

  	it "should raise a Record Invalid error" do
  		expect{ invalid_user.save! }.to raise_error(ActiveRecord::RecordInvalid)
  	end
  end


end
