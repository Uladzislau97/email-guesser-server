# frozen_string_literal: true

class DataBuilder
  def self.call(content)
    content.reduce({}) do |result, (fullname, email)|
      name, surname = fullname.split(' ').map(&:downcase)
      prefix, domain = email.split('@')

      prefix_format = prefix.include?("#{name}#{surname}") ?
        :first_name_last_name :
        :first_name_initial_last_name

      result[domain] ||= prefix_format
      result
    end
  end
end
