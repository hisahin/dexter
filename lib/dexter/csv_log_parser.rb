require "csv"

module Dexter
  class CsvLogParser < LogParser
    def perform
      CSV.new(@logfile).each do |row|
        if (m = REGEX.match(row[13]))
          process_entry(m[3], m[1].to_f)
        end
      end
    rescue CSV::MalformedCSVError => e
      abort "ERROR: #{e.message}"
    end
  end
end
