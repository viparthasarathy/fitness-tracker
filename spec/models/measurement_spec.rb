require 'rails_helper'

describe Measurement do
  it 'has valid factory' do
    expect(FactoryGirl.build(:measurement)).to be_valid
  end

end
