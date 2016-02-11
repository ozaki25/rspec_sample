require 'yaml'

class Toge
  class << self
    def excute
      puts 'toge'
    end

    def load_settings_yaml
      YAML::load_file(File.join(__dir__, '../../conf/settings.yaml'))
    end

    def first_date_string
      settings = load_settings_yaml
      settings[:date][:first_date]
    end

    def last_date_string
      settings = load_settings_yaml
      settings[:date][:last_date]
    end

    def first_date
      Date.parse(first_date_string)
    rescue => e
      puts e.inspect
      exit 1
    end

    def last_date
      Date.parse(last_date_string)
    rescue => e
      puts e.inspect
      exit 1
    end

    def date_range
      first_date..last_date
    end
  end
end

Toge.excute if $0 == __FILE__
