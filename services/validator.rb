# frozen_string_literal: true

class Validator
  def self.call(data, name:, surname:, domain:)
    errors = []

    errors.push('Please enter your name') if blank?(name)
    errors.push('Please enter your surname') if blank?(surname)

    if blank?(domain)
      errors.push('Please enter domain')
    else
      errors.push('Domain not found') unless data[domain]
    end

    errors
  end

  private

  def self.blank?(value)
    value.nil? || value.empty?
  end
end
