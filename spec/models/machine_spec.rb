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
end
