# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:tasks).dependent(:destroy) }
    it { should belong_to(:theme).optional }
    it { should belong_to(:avatar).class_name('Reward').optional }
  end

  describe 'validations' do
    subject { create(:user) } 
  
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
  
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  
    it { should validate_presence_of(:password_digest) }
  end

  describe 'default values' do
    it 'should have a default points of 0' do
      user = User.create!(username: 'testuser', email: 'test@example.com', password: 'password123')
      expect(user.points).to eq(0)
    end
  end

  describe 'optional relationships' do
    it 'can have an optional theme' do
      user = User.create!(username: 'testuser', email: 'test@example.com', password: 'password')
      expect(user.theme).to be_nil
    end

    it 'can have an optional avatar' do
      user = User.create!(username: 'testuser', email: 'test@example.com', password: 'password')
      expect(user.avatar).to be_nil
    end
  end
end