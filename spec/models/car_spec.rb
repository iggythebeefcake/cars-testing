require 'rails_helper'

RSpec.describe Car, type::model do
  describe 'attributes' do
    it 'has a make' do
      make = 'Toyota'
      car = Car.create(make: make)
      expect(car.make).to eq(make)

    it { should respond_to :make }
    end

    describe 'class methods' do
      before(:each) do
        @car1 = Car.create(make: 'Zolo', model: 'Caz', price: 10000)
        @car2 = Car.create(make: 'Abe', model: 'Lincoln', price: 15000)
        @car3 = Car.create(make: 'Baz', model: 'Dolo', price: 12500)
      end

      it 'should sort by make :asc' do
        expect(Car.by_make).to eq([@car2, @car3, @car1,])
      end

      it 'should sort by model :asc' do
        expect(Car.by_model).to eq([@car1, @car3, @car2])
      end

      it 'should sort by price :asc' do
        expect(Car.by_price).to eq([@car1, @car3, @car2])
      end

      it 'should sort by price :desc' do
        expect(Car.by_price(:desc)).to eq([@car2, @car3, @car1])
      end
    end
    
    describe 'instance methods' do
      before(:each) do
        @attr = {
          make: 'Toyota'
          model: 'Prius',
          color: 'Red',
          mileage: 10000,
          price: 10000.49,
          interior: 'Blue'
        }

        @car = Car.create(@attr)
      end


      it 'paints a car' do
        @car.paint('Pink')
        expect(@car.color).to eq('Pink')
      end

      it 'returns a cars info' do
        expect(@car.info).to eq(@attr.with_indifferent_access)
      end

      it 'honks the horn' do
        expect(@car.honk).to eq('Beep Beep!')
      end
    end
end
