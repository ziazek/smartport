require 'csv'

class Chart
  attr_reader :data, :filtered, :result
  def initialize
    csv = CSV.read(File.join(Rails.root, 'lib', 'assets','combined6.csv'), headers: true, header_converters: :symbol)
    @data = []
    csv.each do |row|
      @data << row.to_hash
    end
  end

  def averages_by_month(crane: 0, container: 0)
    filtered = data.select { |row| row[:range_of_tonnage] == "1K-5K" && row[:gross_vessel_throughput].to_f >= 1000.0 && row[:gross_vessel_throughput].to_f < 1300.0 && row[:incident__crane].to_i == crane && row[:incident__container].to_i == container }
    months = filtered.group_by_month { |row| row.fetch(:actual_berth) }
    averages = {}
    months.each do |k, v|
      # v is an array of hashes
      hours = v.map{ |r| r[:gross_hour].to_f }
      values = {
        records: hours.size,
        average_hours: hours.inject(:+) / v.size.to_f,
        min: hours.min,
        max: hours.max
      }
      averages[k] = values
    end
    @result = averages
  end

  def average_hours_ary
    ary = []
    @result.each do |k, v|
      # v is a hash
      ary << [k.to_f * 1000, v[:average_hours].round(1)]
    end
    ary
  end

  def ranges_ary
    ary = []
    @result.each do |k, v|
      # v is a hash
      ary << [k.to_f * 1000, v[:min].round(1), v[:max].round(1)]
    end
    ary
  end

  def main_average
    ary = []
    main_ave = @result.map{ |r, v| v[:average_hours] }.inject(:+) / @result.size
    ary << [@result.keys.first.to_f * 1000, main_ave.round(1)]
    ary << [@result.keys.last.to_f * 1000, main_ave.round(1)]
  end

  def records
    records = @result.map{ |r, v| v[:records] }.inject(:+)
  end
end

# {:vessel_call_cd=>"1500000279",
#  :vessel_record_id=>"53626",
#  :cargo_client_code_cd=>"Cargo Client Code E",
#  :berth_nbr=>"J4A/4",
#  :actual_berth=>"17/2/2015 18:10",
#  :actual_unberth=>"18/2/2015 12:30",
#  :first_activity=>"17/2/2015 19:00",
#  :last_activity=>"18/2/2015 12:00",
#  :gross_hour=>"18.33",
#  :rain_hours=>"0",
#  :gross_vessel_throughput=>"10490.05",
#  :first_cargo=>"18/2/2015 12:00",
#  :last_cargo=>"18/2/2015 7:45",
#  :range_of_tonnage=>">10K",
#  :throughput_per_hour=>"572",
#  :incident__crane=>"0",
#  :incident__container=>"0"}