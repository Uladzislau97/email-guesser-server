# frozen_string_literal: true

require 'sinatra'
require 'sinatra/cors'
require 'json'

require_relative './services/data_builder.rb'
require_relative './services/validator.rb'
require_relative './services/guesser.rb'
require_relative './services/params_sanitizer.rb'

OK_STATUS = 200
VALIDATION_ERROR_STATUS = 422
SERVER_ERROR_STATUS = 500

get '/guess' do
  content = JSON.parse(File.read('./data.json'))
  data = DataBuilder.call(content)

  sanitized_params = ParamsSanitizer.call(params)
  errors = Validator.call(data, **sanitized_params)

  return { code: VALIDATION_ERROR_STATUS, errors: errors }.to_json unless errors.empty?

  begin
    { code: OK_STATUS, data: Guesser.call(data, **sanitized_params) }.to_json
  rescue
    { code: SERVER_ERROR_STATUS }.to_json
  end
end
