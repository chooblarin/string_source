require "string_source/version"
require "string_source/common"
require "string_source/ios"
require "string_source/android"

require "csv"

module StringSource
  def exec(filepath='tmp/strings.csv')
    langs=['en', 'ja']
    data = CSV.read(filepath, headers: true)
    StringSource::IOS.to_resources(data, langs)
    StringSource::Android.to_resources(data, langs)
  end

  module_function :exec
end
