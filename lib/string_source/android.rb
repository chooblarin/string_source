require 'fileutils'
require 'rexml/document'

module StringSource::Android

  def to_resources(data, langs=['en'])
    langs.each do |l|
      StringSource::Android.write_resources(data, l)
    end
  end

  def write_resources(data, lang)
    dir, filename = StringSource::dest('android', lang)
    FileUtils.mkdir_p dir

    doc = REXML::Document.new
    doc.context[:attribute_quote] = :quote
    resources = doc.add_element('resources')
    data.each do |d|
      resources.add_element('string', {"name" => d['name']}).add_text(d[lang])
    end

    formatter = REXML::Formatters::Pretty.new
    formatter.compact = true
    File.open(dir + filename, 'w') do |f|
      formatter.write(doc, f)
    end
  end

  module_function :to_resources, :write_resources
end
