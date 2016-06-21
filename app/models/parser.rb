class Parser

  def self.request_xml http_link
    uri = URI.parse(http_link)
    request = Net::HTTP::Get.new(uri.to_s)
    response = Net::HTTP.start(uri.host, uri.port) {|http|
      http.request(request)
    }
    return response
  end

  def self.get_xml response, type, file
    if response.kind_of? Net::HTTPSuccess
      xml_doc = Nokogiri::XML(response.body)
      Parser.save_xml xml_doc, file
      puts "Alimentando base de dados dos "+ type +" a partir do webservice..."
    else
      xml_doc = Nokogiri::XML(File.open(file))
      puts "WebService dos "+ type +" inacessível.\nAlimentado base de dados dos " + type + " a partir de backup..."
    end
    return xml_doc
  end

  def self.save_xml xml_doc, file
    File.open(file, 'w') {|f| f.write xml_doc}
  end

end
