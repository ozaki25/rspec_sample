class RetryTest
  class << self
    def write_log
      puts "write_log"
      error_count = 0 unless error_count
      log = File.open(File.join(__dir__, '../../tmp/test.log'), 'a')
      log.puts(Time.now)
      raise
      log.close
    rescue
      puts "already #{error_count} times error"
      error_count += 1
      puts "this is #{error_count} times error"
      exit if error_count > 3
      puts "sleep start"
      sleep(1)
      puts "sleep finish"
      retry
    end
  end
end

RetryTest.write_log if $0 == __FILE__
