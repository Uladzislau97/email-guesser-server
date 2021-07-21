# frozen_string_literal: true

class Guesser
  @@prefix_builder = {
    first_name_last_name: ->(name, surname) { "#{name}#{surname}" },
    first_name_initial_last_name: ->(name, surname) { "#{name[0]}#{surname}" }
  }

  def self.call(data, domain:, name:, surname:)
    prefix_format = data[domain]
    prefix = @@prefix_builder[prefix_format].call(name, surname)
    "#{prefix}@#{domain}"
  end
end
