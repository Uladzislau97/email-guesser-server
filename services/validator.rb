# frozen_string_literal: true

class Validator
  def self.call(data, name:, surname:, domain:)
    errors = {}
    errors[:name] = 'Please enter your name' if blank?(name)
    errors[:surname] = 'Please enter your surname' if blank?(surname)
    errors[:domain] = 'Please enter domain' if blank?(domain)
    errors[:domain] ||= 'Domain not found' unless data[domain]
    errors
  end

  private

  def self.blank?(value)
    value.nil? || value.empty?
  end
end
