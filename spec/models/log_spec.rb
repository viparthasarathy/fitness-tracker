require 'rails_helper'

describe Log do

  it 'has valid factory' do
    expect(FactoryGirl.build(:log)).to be_valid
  end

end
