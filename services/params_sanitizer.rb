# frozen_string_literal: true

class ParamsSanitizer
  def self.call(params)
    {
      name: params[:name]&.downcase,
      surname: params[:surname]&.downcase,
      domain: params[:domain]&.downcase
    }
  end
end
