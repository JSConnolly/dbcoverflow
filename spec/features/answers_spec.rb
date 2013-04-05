require 'spec_helper'

describe "answers" do
  subject { page }
  
  let(:submit_button){ "Submit" }
  let(:user){ FactoryGirl.create(:user) }
  let(:question){ FactoryGirl.create(:question) }
  
    before do
      login(user)
      visit question_path(question.id)
    end

  context "with valid entry", js: true do

    before do
     fill_in 'Answer', with: Faker::Lorem.sentence()
     click_button submit_button
    end


    it { should have_content user.name}
  end

  context "with invalid entry", js: true do
    # let!(:user2){ FactoryGirl.create(:user) }

    before do
      # reset_session!
      # login(user2)
      # question = FactoryGirl.create(:question)
      visit question_path(question.id)
      fill_in 'Answer', with: ""
      click_button submit_button
    end

    it { should_not have_content user.name}
  end
end