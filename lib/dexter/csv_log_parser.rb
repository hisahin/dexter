require "csv"

module Dexter
  class CsvLogParser < LogParser
    def perform
      CSV(@logfile) do |csv|
        csv.each do |row|
          if m = REGEX.match(row[13])
            process_entry(m[3], m[1].to_f)
          end
        end
      end
    end
  end
end