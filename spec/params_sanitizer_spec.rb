# frozen_string_literal: true

require_relative '../services/params_sanitizer.rb'

RSpec.describe ParamsSanitizer do
  let(:params) do
    {
      name: 'Name',
      surname: 'surNaMe',
      domain: nil
    }
  end

  it 'returns existing params in downcase format' do
    expect(described_class.call(params)).to include(
      name: 'name',
      surname: 'surname',
      domain: nil
    )
  end
end
