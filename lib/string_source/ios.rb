module StringSource::IOS

  def to_resources(data, langs=['en'])
    langs.each do |l|
      StringSource::IOS.write_resources(data, l)
    end
  end

  def write_resources(data, lang)
    dir, filename = StringSource::dest('ios', lang)
    FileUtils.mkdir_p dir
    File.open(dir + filename, 'w') do |f|
      data.each do |d|
        next unless d['ios'].to_bool
        key = StringSource.camelize(d['name'])
        f.puts "\"#{key}\" = \"#{d[lang]}\";"
      end
    end
  end

  module_function :to_resources, :write_resources
end
