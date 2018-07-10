require 'nokogiri'

sample_dir = ARGV[0]
docNum = ARGV[1].to_s
schema = File.join(sample_dir, 'schema.xsd')
stylesheet = File.join(sample_dir, 'xslt', "stylesheet#{docNum}.xsl")

doc = File.join(sample_dir, "doc#{docNum}.xml")

xslt = Nokogiri::XSLT(File.read(stylesheet))

def apply(xslt, path)
  xml = Nokogiri::XML(File.read(path))
  xslt.apply_to(xml)
end

puts apply(xslt, doc)

