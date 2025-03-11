require 'rails_helper'

RSpec.describe ServiceError do
  describe '#initialize' do
    context 'when a single error is passed' do
      let(:error) { 'Something went wrong' }
      let(:status) { 422 }
      let(:service_error) { ServiceError.new(error, status) }

      it 'sets the error as an array' do
        expect(service_error.errors).to eq(['Something went wrong'])
      end

      it 'sets the status correctly' do
        expect(service_error.status).to eq(422)
      end
    end

    context 'when multiple errors are passed' do
      let(:errors) { ['Name can\'t be blank', 'Priority is invalid'] }
      let(:status) { 422 }
      let(:service_error) { ServiceError.new(errors, status) }

      it 'sets the errors as an array' do
        expect(service_error.errors).to eq(['Name can\'t be blank', 'Priority is invalid'])
      end

      it 'sets the status correctly' do
        expect(service_error.status).to eq(422)
      end
    end
  end
end
