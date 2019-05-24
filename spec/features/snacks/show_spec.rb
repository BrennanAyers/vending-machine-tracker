require 'rails_helper'

RSpec.describe 'As a user', type: :feature do
  describe 'When I visit a Snack show page' do
    before :each do
      @owner = Owner.create(name: "Sam's Snacks")
      @dons  = @owner.machines.create(location: "Don's Mixed Drinks")
      @turing = @owner.machines.create(location: "Turing Basement")
      @cheetos = @dons.snacks.create!(name: "Flaming Hot Cheetos", price: 2.5)
      @white_castle = @dons.snacks.create!(name: "White Castle Burger", price: 3.5)
      @pop_rocks = @dons.snacks.create!(name: "Pop Rocks", price: 1.5)
      @turing.snacks << @cheetos
      @turing.snacks << @white_castle
    end

    it 'should display the name and price of the snack' do
      visit snack_path(@cheetos)

    end
  end
end
