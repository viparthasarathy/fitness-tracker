require 'rails_helper'

describe :Food, :type => :model do
  before do
    @food = FactoryGirl.build(:food)
  end

  it 'has valid factory' do
    expect(@food).to be_valid
  end

  context 'properties' do
    it 'responds to calories'
    it 'responds to protein'
    it 'responds to carbs'
    it 'responds to fats'
  end

  context 'validations' do
    it 'requires the presence of calories'
    it 'requires the presence of protein'
    it 'requires the presence of carbs'
    it 'requires the presence of fats'
  end

  context 'lifecycle callbacks' do
    context 'create' do
      it 'updates total calories for parent entry when created'
      it 'updates total carbs for parent entry when created'
      it 'updates total fats for parent entry when created'
      it 'updates total protein for parent entry when created'
      it 'updates total calories for grandparent chapter when created'
      it 'updates total carbs for grandparent chapter when created'
      it 'updates total fats for grandparent chapter when created'
      it 'updates total protein for grandparent chapter when created'
    end

    context 'update' do
      it 'updates total calories for parent entry when updated'
      it 'updates total carbs for parent entry when updated'
      it 'updates total fats for parent entry when updated'
      it 'updates total protein for parent entry when updated'
      it 'updates total calories for grandparent chapter when updated'
      it 'updates total carbs for grandparent chapter when updated'
      it 'updates total fats for grandparent chapter when updated'
      it 'updates total calories for parent entry when destroyed'
      it 'updates total protein for grandparent chapter when updated'
    end

    context 'destroy' do
      it 'updates total carbs for parent entry when destroyed'
      it 'updates total fats for parent entry when destroyed'
      it 'updates total protein for parent entry when destroyed'
      it 'updates total calories for grandparent chapter when destroyed'
      it 'updates total carbs for grandparent chapter when destroyed'
      it 'updates total fats for grandparent chapter when destroyed'
      it 'updates total protein for grandparent chapter when destroyed'
    end
  end
end
