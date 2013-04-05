require 'spec_helper'

describe Vote do
  it { should respond_to :user }
  it { should respond_to :points }
  it { should respond_to :voteable_type}

  it { should validate_presence_of :user_id }
  it { should validate_presence_of :voteable_id }
  it { should validate_presence_of :voteable_type}
  it { should validate_presence_of :points }

  it { should belong_to(:user) }

  it { should ensure_inclusion_of(:voteable_type).in_array(['comment', 
                                                            'answer']) }

  it { should ensure_inclusion_of(:points).in_array([-1,1]) }


end