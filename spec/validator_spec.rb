# frozen_string_literal: true

require_relative '../services/validator.rb'

RSpec.describe Validator do
  let(:data) { { 'domain.com' => :prefix_format } }

  let(:params) do
    {
      name: 'name',
      surname: 'surname',
      domain: 'domain.com'
    }
  end

  context 'params are valid' do
    it 'returns empty array' do
      expect(described_class.call(data, **params)).to eq([])
    end
  end

  context 'params are invalid' do
    it 'returns array of error messages' do
      current_params = params.merge(name: '', surname: nil, domain: 'wrong.com')
      expect(described_class.call(data, **current_params)).to match_array([
        'Domain not found',
        'Please enter your name',
        'Please enter your surname'
      ])
    end

    context 'when many errors in one field' do
      it 'returns only first error' do
        current_params = params.merge(domain: nil)
        expect(described_class.call(data, **current_params)).to include('Please enter domain')
        expect(described_class.call(data, **current_params)).not_to include('Domain not found')
      end
    end
  end
end
