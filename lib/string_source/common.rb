module StringSource

  def camelize(snake_case_str)
    return snake_case_str.split('_').collect(&:capitalize).join
  end

  def dest(platform, lang='en')
    if platform == 'ios' then
      filename = 'Localizable.strings'
      case lang
        when 'en' then dir = "#{platform}/Base.lproj/"
        when 'ja' then dir = "#{platform}/ja.lproj/"
        else           dir = "#{platform}/Base.lproj/"
      end
    elsif platform == 'android' then
      filename = 'strings.xml'
      case lang
        when 'en' then dir = "#{platform}/values/"
        when 'ja' then dir = "#{platform}/values-ja/"
        else           dir = "#{platform}/values/"
      end
    else
      raise "#{platform} is not supported platform"
    end

    return dir, filename
  end

  module_function :camelize, :dest
end

# to-bool
# see http://portaltan.hatenablog.com/entry/2015/07/29/130359

class String
  def to_bool
    return self if self.class.kind_of?(TrueClass) || self.class.kind_of?(FalseClass)

    if self =~ /^(true|false)$/
      return true if $1 == 'true'
      return false if $1 == 'false'
    else
      raise NoMethodError.new("undefined method `to_bool' for '#{self}'")
    end
  end
end
