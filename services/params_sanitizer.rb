# frozen_string_literal: true

class ParamsSanitizer
  def self.call(params)
    {
      name: sanitize(params[:name]),
      surname: sanitize(params[:surname]),
      domain: sanitize(params[:domain])
    }
  end

  private

  def self.sanitize(value)
    value&.strip&.downcase
  end
end
