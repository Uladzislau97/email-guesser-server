# frozen_string_literal: true

require_relative '../services/data_builder.rb'

RSpec.describe DataBuilder do
  let(:content) do
    {
      'Jane Doe' => 'jdoe@babbel.com',
      'Jay Arun' => 'jayarun@linkedin.com',
      'David Stein' => 'davidstein@google.com',
      'Mat Lee' => 'matlee@google.com',
      'Marta Dahl' => 'mdahl@babbel.com',
      'Vanessa Boom' => 'vboom@babbel.com'
    }
  end

  it 'builds {domain: profix_format} hash' do
    expect(described_class.call(content)).to include(
      'babbel.com' => :first_name_initial_last_name,
      'google.com' => :first_name_last_name,
      'linkedin.com' => :first_name_last_name
    )
  end
end
