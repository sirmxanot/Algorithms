def schedule_wl_dif(file_name="test_data/jobs.csv")
  require "csv"
  
  jobs ||= [] 
  cum_time ||= 0
  sum ||= 0

  #read in graph
  CSV.foreach(file_name, :converters => :integer) do |row| 
    dif = row[0] - row[1]
    job = [dif, row[0], row[1]]
    jobs << job
  end

  jobs = jobs.sort.reverse

  jobs.each do |job|
    cum_time += job[2]
    sum += cum_time*job[1]
  end

  sum
end

def test
  schedule_wl_dif == 69119377652
end