require 'yaml'

class Toge
  class << self
    def excute
      puts 'toge'
    end

    def load_settings_yaml
      YAML::load_file(File.join(__dir__, '../../conf/settings.yaml'))
    rescue
      exit_for_error
    end

    def first_date_string
      settings = load_settings_yaml
      raise StandardError if !settings || !settings[:date] || !settings[:date][:first_date]
      settings[:date][:first_date]
    rescue
      exit_for_error
    end

    def last_date_string
      settings = load_settings_yaml
      raise StandardError if !settings || !settings[:date] || !settings[:date][:last_date]
      settings[:date][:last_date]
    rescue
      exit_for_error
    end

    def first_date
      Date.parse(first_date_string)
    rescue
      exit_for_error
    end

    def last_date
      Date.parse(last_date_string)
    rescue
      exit_for_error
    end

    def date_range
      first_date..last_date
    end

    def exit_for_error
      puts $!
      puts $@
      exit 1
    end
  end
end

Toge.excute if $0 == __FILE__
