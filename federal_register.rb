require "faraday"
require "json"
require "pp"

class FederalRegister
  def self.test
    res = Faraday.get("https://www.federalregister.gov/api/v1/documents.json?per_page=50&order=newest&conditions%5Bpresidential_document_type%5D%5B%5D=executive_order")

    pp JSON.parse(res.body)
  end

  def self.backfill
    res = Faraday.get("https://www.federalregister.gov/api/v1/documents.json?per_page=50&order=newest&conditions%5Bpublication_date%5D%5Bgte%5D=2017-01-24&conditions%5Bpresidential_document_type%5D%5B%5D=executive_order")

    pp JSON.parse(res.body)
  end
end
