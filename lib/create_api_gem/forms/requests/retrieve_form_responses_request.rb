require_relative 'form_request'
require 'open-uri'

class RetrieveFormResponsesRequest < FormRequest
  def initialize(form_id, token: APIConfig.token)
    r = {
      method: :get,
      url: "#{APIConfig.api_request_url}/forms/#{form_id}/responses"
    }
    r[:headers] = { 'Authorization' => "Bearer #{token}" } unless token.nil?

    request(r)
  end

  def success?
    @response.code == 200 && json?
  end

  def responses
    json
  end
end
