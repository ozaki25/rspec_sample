require_relative './toge'

class Togege < Toge
  class << self
    def excute
      puts load_settings_yaml
      puts first_date_string
      puts last_date_string
      puts first_date
      puts last_date
      puts date_range
    end
  end
end

Togege.excute if $0 == __FILE__
