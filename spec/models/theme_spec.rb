require 'rails_helper'

RSpec.describe Theme, type: :model do
  describe 'validations' do
    subject { create(:theme) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end