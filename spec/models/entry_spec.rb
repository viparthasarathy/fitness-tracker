require 'rails_helper'

describe Entry do
  it 'has valid factory' do
    expect(FactoryGirl.build(:entry)).to be_valid
  end

end
