require 'spec_helper'

describe Answer do
  it { should respond_to :content }
  it { should respond_to :user }
  it { should respond_to :question}

  it { should validate_presence_of :user_id }
end
