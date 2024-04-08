require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'saves when all fields have a value' do
      @category = Category.new( { name: 'Succulents' } )
      @category.save
      @product = Product.new( {name: 'Cactus', price: 10.99, quantity: 5, category: @category} )
      @product.save
    
      expect(@product.id).to be_present 
      expect(@product.errors.full_messages).to_not be_present

    end

    it 'does not save when name field empty' do
      @category = Category.new( { name: 'Succulents' } )
      @category.save
      @product = Product.new( {name: nil, price: 10.99, quantity: 5, category: @category} )
      @product.save
    
      expect(@product.id).to be_nil 
      expect(@product.errors.full_messages).to be_present
    end

    it 'does not save when price field empty' do
      @category = Category.new( { name: 'Succulents' } )
      @category.save
      @product = Product.new( {name: 'Cactus', price: nil, quantity: 5, category: @category} )
      @product.save
    
      expect(@product.id).to be_nil 
      expect(@product.errors.full_messages).to be_present
    end

    it 'does not save when quantity field empty' do
      @category = Category.new( { name: 'Succulents' } )
      @category.save
      @product = Product.new( {name: 'Cactus', price: 10.99, quantity: nil, category: @category} )
      @product.save
    
      expect(@product.id).to be_nil 
      expect(@product.errors.full_messages).to be_present
    end

    it 'does not save when category field empty' do
      @category = Category.new( { name: 'Succulents' } )
      @category.save
      @product = Product.new( {name: 'Cactus', price: 10.99, quantity: 5, category: nil } )
      @product.save
    
      expect(@product.id).to be_nil 
      expect(@product.errors.full_messages).to be_present
    end


  end
end
