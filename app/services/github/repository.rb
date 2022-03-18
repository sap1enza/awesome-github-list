module Github
  class Repository < Client
    def get(full_name, params = nil)
      response = RestClient.get("#{base_url}/repos/#{full_name}", params)
      JSON.parse(response)
    rescue RestClient::NotFound
      nil
    end
  end
end
