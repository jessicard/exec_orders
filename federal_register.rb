require "faraday"
require "json"
require "./executive_order"

class FederalRegister
  def self.test
    Faraday.get("https://www.federalregister.gov/api/v1/documents.json?per_page=50&order=newest&conditions%5Bpresidential_document_type%5D%5B%5D=executive_order").body
  end

  def self.backfill
    res = Faraday.get("https://www.federalregister.gov/api/v1/documents.json?per_page=50&order=oldest&conditions%5Bpublication_date%5D%5Bgte%5D=2017-01-24&conditions%5Bpresidential_document_type%5D%5B%5D=executive_order")

    JSON.parse(res.body)["results"].map { |eo| ExecutiveOrder.from_federal_register_hash(eo) }
  end
end
