require 'rails_helper'

describe :Food, :type => :model do
  before do
    @food = FactoryGirl.build(:food)
  end

  it 'has valid factory' do
    expect(@food).to be_valid
  end

  context 'properties' do
    it 'responds to calories' do
      expect (@food).to respond_to(:calories)
    end

    it 'responds to protein' do
      expect(@food).to respond_to(:protein)
    end

    it 'responds to carbs' do
      expect(@food).to respond_to(:carbs)
    end

    it 'responds to fats' do
      expect(@food).to respond_to(:fats)
    end
  end

  context 'validations' do
    it 'requires the presence of calories' do
      food = FactoryGirl.build(:food, calories: nil)
      expect(food).to have(1).error_on(:calories)
    end

    it 'requires the presence of protein' do
      food = FactoryGirl.build(:food, protein: nil)
      expect(food).to have(1).error_on(:protein)
    end

    it 'requires the presence of carbs' do
      food = FactoryGirl.build(:food, carbs: nil)
      expect(food).to have(1).error_on(:carbs)
    end

    it 'requires the presence of fats' do
      food = FactoryGirl.build(:food, fats: nil)
      expect(food).to have(1).error_on(:fats)
    end
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
