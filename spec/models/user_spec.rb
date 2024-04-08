require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'saves when all fields have a value and password matches confirmation' do
      @user = User.new({ first_name: 'Jenna', last_name: 'Jones', email: 'jenna@example.com', password: 'password', password_confirmation: 'password' })
      @user.save!
    end

    it 'does not save when first_name nil' do
      @user = User.new({ first_name: nil, last_name: 'Jones', email: 'jenna@example.com', password: 'password', password_confirmation: 'password' })
      @user.save

      expect(@user.id).to be_nil
      expect(@user.errors.full_messages).to be_present
    end

    it 'does not save when last_name nil' do
      @user = User.new({ first_name: 'Jenna', last_name: nil, email: 'jenna@example.com', password: 'password', password_confirmation: 'password' })
      @user.save

      expect(@user.id).to be_nil
      expect(@user.errors.full_messages).to be_present
    end

    it 'does not save when email nil' do
      @user = User.new({ first_name: 'Jenna', last_name: 'Jones', email: nil, password: 'password', password_confirmation: 'password' })
      @user.save

      expect(@user.id).to be_nil
      expect(@user.errors.full_messages).to be_present
    end

    it 'does not save when password nil' do
      @user = User.new({ first_name: 'Jenna', last_name: 'Jones', email: 'jenna@example.com', password: nil, password_confirmation: 'password' })
      @user.save

      expect(@user.id).to be_nil
      expect(@user.errors.full_messages).to be_present
    end

    it 'does not save when password_confirmation nil' do
      @user = User.new({ first_name: 'Jenna', last_name: 'Jones', email: 'jenna@example.com', password: 'password', password_confirmation: nil })
      @user.save

      expect(@user.id).to be_nil
      expect(@user.errors.full_messages).to be_present
    end

    it 'does not save when password does not match confirmation' do
      @user = User.new({ first_name: 'Jenna', last_name: 'Jones', email: 'jenna@example.com', password: 'paswords', password_confirmation: 'password' })
      @user.save

      expect(@user.id).to be_nil
      expect(@user.errors.full_messages).to be_present
    end

    it 'does not save when email already exists in database, not case sensitive' do
      @user1 = User.new({ first_name: 'Jenna', last_name: 'Jones', email: 'jenna@example.com', password: 'password', password_confirmation: 'password' })
      @user1.save

      expect(@user1.id).to be_present
      expect(@user1.errors.full_messages).to_not be_present

      @user2 = User.new({ first_name: 'Jennifer', last_name: 'McCarthy', email: 'JENNA@example.com', password: 'wordpass', password_confirmation: 'wordpass' })
      @user2.save

      expect(@user2.id).to be_nil
      expect(@user2.errors.full_messages).to be_present
    end

    it 'does not save when password is below minimum length' do
      @user1 = User.new({ first_name: 'Jenna', last_name: 'Jones', email: 'jenna@example.com', password: 'passwor', password_confirmation: 'passwor' })
      @user1.save

      expect(@user1.id).to be_nil
      expect(@user1.errors.full_messages).to be_present
    end
  end

  describe '.authenticate_with_credentials' do
    it 'will return user instance when email and password of existing user are used as args' do
      @user = User.new({ first_name: 'Jenna', last_name: 'Jones', email: 'jenna@example.com', password: 'password', password_confirmation: 'password' })
      @user.save!

      result = User.authenticate_with_credentials('jenna@example.com', 'password')

      expect(result).to be_eql(@user)
    end

    it 'will return nil when email and password of existing user are not used as args' do
      @user = User.new({ first_name: 'Jenna', last_name: 'Jones', email: 'jenna@example.com', password: 'password', password_confirmation: 'password' })
      @user.save!

      result = User.authenticate_with_credentials('j@example.com', 'password')

      expect(result).to be nil
    end

    it 'will return user instance when email has extra spaces before/after email' do
      @user = User.new({ first_name: 'Jenna', last_name: 'Jones', email: 'jenna@example.com', password: 'password', password_confirmation: 'password' })
      @user.save!

      result = User.authenticate_with_credentials('  jenna@example.com   ', 'password')

      expect(result).to be_eql(@user)
    end

    it 'will return user instance when email has wrong case' do
      @user = User.new({ first_name: 'Jenna', last_name: 'Jones', email: 'jenna@example.com', password: 'password', password_confirmation: 'password' })
      @user.save!

      result = User.authenticate_with_credentials('JENNA@example.com', 'password')

      expect(result).to be_eql(@user)
    end

  end
end