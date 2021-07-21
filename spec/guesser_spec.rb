# frozen_string_literal: true

require_relative '../services/guesser.rb'

RSpec.describe Guesser do
  let(:data) do
    {
      'one.com' => :first_name_last_name,
      'two.com' => :first_name_initial_last_name
    }
  end

  let(:params) do
    { name: 'max', surname: 'pain' }
  end

  context 'domain corresponds to full first name' do
    it 'returns email with full first name' do
      current_params = params.merge(domain: 'one.com')
      expect(described_class.call(data, **current_params)).to eq('maxpain@one.com')
    end
  end

  context 'domain corresponds to first name initial' do
    it 'returns email with first name initial' do
      current_params = params.merge(domain: 'two.com')
      expect(described_class.call(data, **current_params)).to eq('mpain@two.com')
    end
  end
end
