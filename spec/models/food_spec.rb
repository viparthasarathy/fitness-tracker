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
      expect(@food).to respond_to(:calories)
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

    it 'responds to name' do
      expect(@food).to respond_to(:name)
    end
  end

  context 'associations' do
    it 'belongs to an entry' do
      expect(@food).to respond_to(:entry)
    end
  end

  context 'validations' do
    it 'requires the presence of an entry' do
      @food.entry = nil
      expect(@food).to have(1).error_on(:entry)
    end

    it 'requires a name' do
      @food.name = nil
      expect(@food).to have(1).error_on(:name)
    end

    it 'requires the presence of calories' do
      @food.calories = nil
      expect(@food).to have(1).error_on(:calories)
    end

    it 'requires the presence of protein' do
      @food.protein = nil
      expect(@food).to have(1).error_on(:protein)
    end

    it 'requires the presence of carbs' do
      @food.carbs = nil
      expect(@food).to have(1).error_on(:carbs)
    end

    it 'requires the presence of fats' do
      @food.fats = nil
      expect(@food).to have(1).error_on(:fats)
    end

    it 'requires calories to be an integer' do
      @food.calories = 10.50
      expect(@food).to have(1).error_on(:calories)
      @food.calories = "wow"
      expect(@food).to have(1).error_on(:calories)
    end

    it 'requires protein to be an integer' do
      @food.protein = 10.50
      expect(@food).to have(1).error_on(:protein)
      @food.protein = "wow"
      expect(@food).to have(1).error_on(:protein)
    end

    it 'requires carbs to be an integer' do
      @food.carbs = 10.50
      expect(@food).to have(1).error_on(:carbs)
      @food.carbs = "wow"
      expect(@food).to have(1).error_on(:carbs)
    end

    it 'requires fats to be an integer' do
      @food.fats = 10.50
      expect(@food).to have(1).error_on(:fats)
      @food.fats = "wow"
      expect(@food).to have(1).error_on(:fats)
    end

    it 'requires calories to be at least zero' do
      @food.calories = -1
      expect(@food).to have(1).error_on(:calories)
    end

    it 'requires protein to be at least zero' do
      @food.protein = -1
      expect(@food).to have(1).error_on(:protein)
    end

    it 'requires carbs to be at least zero' do
      @food.carbs = -1
      expect(@food).to have(1).error_on(:carbs)
    end

    it 'requires fats to be at least zero' do
      @food.fats = -1
      expect(@food).to have(1).error_on(:fats)
    end
  end

  context 'totals' do
    before do
      @entry = @food.entry
      @chapter = @entry.chapter
    end

    context 'create' do
      it 'updates total calories for parent entry when created' do
        previous_calories = @entry.total_calories
        @food.save
        expect(@entry.total_calories).to eq(previous_calories + @food.calories)
      end
      it 'updates total carbs for parent entry when created' do
        previous_carbs = @entry.total_carbs
        @food.save
        expect(@entry.total_carbs).to eq(previous_carbs + @food.carbs)
      end
      it 'updates total fats for parent entry when created' do
        previous_fats = @entry.total_fats
        @food.save
        expect(@entry.total_fats).to eq(previous_fats + @food.fats)
      end
      it 'updates total protein for parent entry when created' do
        previous_protein = @entry.total_protein
        @food.save
        expect(@entry.total_protein).to eq(previous_protein + @food.protein)
      end
      it 'updates total calories for grandparent chapter when created' do
        previous_calories = @chapter.total_calories
        @food.save
        expect(@chapter.total_calories).to eq(previous_calories + @food.calories)
      end
      it 'updates total carbs for grandparent chapter when created' do
        previous_carbs = @chapter.total_carbs
        @food.save
        expect(@chapter.total_carbs).to eq(previous_carbs + @food.carbs)
      end
      it 'updates total fats for grandparent chapter when created' do
        previous_fats = @chapter.total_fats
        @food.save
        expect(@chapter.total_fats).to eq(previous_fats + @food.fats)
      end
      it 'updates total protein for grandparent chapter when created' do
        previous_protein = @chapter.total_protein
        @food.save
        expect(@chapter.total_protein).to eq(previous_protein + @food.protein)
      end
    end

    context 'update' do
      it 'updates total calories for parent entry when updated' do
        previous_total_calories = @entry.total_calories
        @food.save
        previous_calories = @food.calories
        @food.update(calories: 800)
        expect(@entry.total_calories).to eq(previous_total_calories + 800)
        expect(@entry.total_calories).to_not eq(previous_total_calories + previous_calories)
      end

      it 'updates total carbs for parent entry when updated' do
        previous_total_carbs = @entry.total_carbs
        @food.save
        previous_carbs = @food.carbs
        @food.update(carbs: 100)
        expect(@entry.total_carbs).to eq(previous_total_carbs + 100)
        expect(@entry.total_carbs).to_not eq(previous_total_carbs + previous_carbs)
      end

      it 'updates total fats for parent entry when updated' do
        previous_total_fats = @entry.total_fats
        @food.save
        previous_fats = @food.fats
        @food.update(fats: 100)
        expect(@entry.total_fats).to eq(previous_total_fats + 100)
        expect(@entry.total_fats).to_not eq(previous_total_fats + previous_fats)
      end

      it 'updates total protein for parent entry when updated' do
        previous_total_protein = @entry.total_protein
        @food.save
        previous_protein = @food.protein
        @food.update(protein: 100)
        expect(@entry.total_protein).to eq(previous_total_protein + 100)
        expect(@entry.total_protein).to_not eq(previous_total_protein + previous_protein)
      end

      it 'updates total calories for grandparent chapter when updated' do
        previous_total_calories = @chapter.total_calories
        @food.save
        previous_calories = @food.calories
        @food.update(calories: 800)
        expect(@chapter.total_calories).to eq(previous_total_calories + 800)
        expect(@chapter.total_calories).to_not eq(previous_total_calories + previous_calories)
      end

      it 'updates total carbs for grandparent chapter when updated' do
        previous_total_carbs = @chapter.total_carbs
        @food.save
        previous_carbs = @food.carbs
        @food.update(carbs: 100)
        expect(@chapter.total_carbs).to eq(previous_total_carbs + 100)
        expect(@chapter.total_carbs).to_not eq(previous_total_carbs + previous_carbs)
      end

      it 'updates total fats for grandparent chapter when updated' do
        previous_total_fats = @chapter.total_fats
        @food.save
        previous_fats = @food.fats
        @food.update(fats: 100)
        expect(@chapter.total_fats).to eq(previous_total_fats + 100)
        expect(@chapter.total_fats).to_not eq(previous_total_fats + previous_fats)
      end

      it 'updates total protein for grandparent chapter when updated' do
        previous_total_protein = @chapter.total_protein
        @food.save
        previous_protein = @food.protein
        @food.update(protein: 100)
        expect(@chapter.total_protein).to eq(previous_total_protein + 100)
        expect(@chapter.total_protein).to_not eq(previous_total_protein + previous_protein)
      end
    end

    context 'destroy' do
      it 'updates total calories for parent entry when destroyed' do
        previous_total_calories = @chapter.total_calories
        @food.save
        expect(@chapter.total_calories).to eq(previous_total_calories + @food.calories)
        @food.destroy
        expect(@chapter.total_calories).to eq(previous_total_calories)
      end

      it 'updates total carbs for parent entry when destroyed' do
        previous_total_calories = @chapter.total_calories
        @food.save
        expect(@chapter.total_calories).to eq(previous_total_calories + @food.calories)
        @food.destroy
        expect(@chapter.total_calories).to eq(previous_total_calories)
      end

      it 'updates total fats for parent entry when destroyed' do
        previous_total_calories = @chapter.total_calories
        @food.save
        expect(@chapter.total_calories).to eq(previous_total_calories + @food.calories)
        @food.destroy
        expect(@chapter.total_calories).to eq(previous_total_calories)
      end

      it 'updates total protein for parent entry when destroyed' do
        previous_total_calories = @chapter.total_calories
        @food.save
        expect(@chapter.total_calories).to eq(previous_total_calories + @food.calories)
        @food.destroy
        expect(@chapter.total_calories).to eq(previous_total_calories)
      end

      it 'updates total calories for grandparent chapter when destroyed' do
        previous_total_calories = @chapter.total_calories
        @food.save
        expect(@chapter.total_calories).to eq(previous_total_calories + @food.calories)
        @food.destroy
        expect(@chapter.total_calories).to eq(previous_total_calories)
      end

      it 'updates total carbs for grandparent chapter when destroyed' do
        previous_total_calories = @chapter.total_calories
        @food.save
        expect(@chapter.total_calories).to eq(previous_total_calories + @food.calories)
        @food.destroy
        expect(@chapter.total_calories).to eq(previous_total_calories)
      end

      it 'updates total fats for grandparent chapter when destroyed' do
        previous_total_calories = @chapter.total_calories
        @food.save
        expect(@chapter.total_calories).to eq(previous_total_calories + @food.calories)
        @food.destroy
        expect(@chapter.total_calories).to eq(previous_total_calories)
      end

      it 'updates total protein for grandparent chapter when destroyed' do
        previous_total_calories = @chapter.total_calories
        @food.save
        expect(@chapter.total_calories).to eq(previous_total_calories + @food.calories)
        @food.destroy
        expect(@chapter.total_calories).to eq(previous_total_calories)
      end
    end
  end
end
