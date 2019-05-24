require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'relationships' do
    it {should have_many :snacks}
    it {should belong_to :owner}
  end

  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe 'instance methods' do
    before :each do
      @owner = Owner.create(name: "Sam's Snacks")
      @dons  = @owner.machines.create(location: "Don's Mixed Drinks")
      @white_castle = @dons.snacks.create!(name: "White Castle Burger", price: 3.0)
      @pop_rocks = @dons.snacks.create!(name: "Pop Rocks", price: 1.0)
      @cheetos = @dons.snacks.create!(name: "Flaming Hot Cheetos", price: 2.0)
    end

    it '#average_price' do
      expect(@dons.average_price).to eq(2.0)
    end

    it '#snack_count' do
      expect(@dons.snack_count).to eq(3)
    end
  end
end
