require 'rails_helper'

describe Day do

  it 'has valid factory' do
    expect(FactoryGirl.build(:day)).to be_valid
  end

end
