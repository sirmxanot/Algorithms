def schedule_wl_dif(file_name="jobs.csv")
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