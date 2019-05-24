require 'rails_helper'

RSpec.describe 'As a user', type: :feature do
  describe'When I visit a Vending Machine show page' do
    before :each do
      @owner = Owner.create(name: "Sam's Snacks")
      @dons  = @owner.machines.create(location: "Don's Mixed Drinks")
      @white_castle = @dons.snacks.create!(name: "White Castle Burger", price: 3.5)
      @pop_rocks = @dons.snacks.create!(name: "Pop Rocks", price: 1.5)
      @cheetos = @dons.snacks.create!(name: "Flaming Hot Cheetos", price: 2.5)
    end

    it 'should display all snacks in that machine with their price' do
      visit machine_path(@dons)
    end
  end
end
