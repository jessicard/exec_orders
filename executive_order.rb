class ExecutiveOrder
  attr_reader :title
  attr_reader :document_number
  attr_reader :url

  def initialize(title:, document_number:, url:)
    @title = title
    @document_number = document_number
    @url = url
  end

  def self.from_federal_register_hash(federal_register_hash)
    new(
      title: federal_register_hash["title"],
      document_number: federal_register_hash["document_number"],
      url: federal_register_hash["html_url"]
    )
  end
end
