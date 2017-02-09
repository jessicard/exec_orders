require "faraday"
require "json"
require "pp"

class FederalRegister
  def self.test
    res = Faraday.get("https://www.federalregister.gov/api/v1/documents.json?per_page=20&order=relevance&conditions%5Bpresidential_document_type%5D%5B%5D=executive_order")

    pp JSON.parse(res.body)
  end
end
