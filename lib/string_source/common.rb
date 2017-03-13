module StringSource

  def camelize(snake_case_str)
    return snake_case_str.split('_').collect(&:capitalize).join
  end

  def dest(platform, lang='en')
    if platform == 'ios' then
      filename = 'Localizable.strings'
      case lang
        when 'en' then dir = "#{platform}/Base.lproj/"
        when 'jp' then dir = "#{platform}/ja.lproj/"
        else           dir = "#{platform}/Base.lproj/"
      end
    elsif platform == 'android' then
      filename = 'strings.xml'
      case lang
        when 'en' then dir = "#{platform}/values/"
        when 'jp' then dir = "#{platform}/values-ja/"
        else           dir = "#{platform}/values/"
      end
    else
      raise "#{platform} is not supported platform"
    end

    return dir, filename
  end

  module_function :camelize, :dest
end
