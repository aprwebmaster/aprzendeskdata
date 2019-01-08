tamiTickets = Ticket.recents.where(:a_id => 373188258231) 
    
    #empty array to store individual tickets in 
    @tamiTicketValues = []

    #extract ticket values from variable and place in array
    tamiTickets.each do |value|
      @tamiTicketValues << value 
    end

    #create empty array to hold zen_id values in 
    @tamiTicketId = []

    #Collect values from tamis ticket's and store the value in zen_id inside array
    @tamiTicketValues.collect do |value|
      @tamiTicketId << value["zen_id"]
    end

    #create empty arrays to hold more values 
    @tamiMetrics = []
    @tamiMetricsCalendarValues = []
    @tamiMetricsBusinessValues = []
    @tamiMetricsTimes = []
    @tamiMetricID = []
    
    #iterates through each zen_id, adds the TicketMetric with matching tick_id to an array 
    @tamiTicketId.each do |value|
      metric = TicketMetric.where(:tick_id => value)
        metric.each do |values|
          @tamiMetrics << values 
        end
      
    end

    #collect values of ticketmetrics and store reply_time_in_minutes within an array.
    @tamiMetrics.collect do |value|
      @tamiMetricsTimes << value["reply_time_in_minutes"]
    end

   
    #extracting the reply time during all hours by storing each ticket's reply time in an array , adding zeros for nil values so averages are accurate. 
    @tamiMetricsTimes.each do |value|

      v = value["calendar"]
      if v != nil
      @tamiMetricsCalendarValues << v 
      else
      #@metricsBusinessValues << 0 include this if calculating MEAN instead of MEDIAN
        next  
      end
    end

    #extracting the reply time during ONLY business hours. Adds zero to the arrays so that averages reflect an accurate time measurement. 
    @tamiMetricsTimes.each do |value|
      b = value["business"]
      if b != nil
      @tamiMetricsBusinessValues << b 
      else
     # @metricsBusinessValues << 0 include this if calculating MEAN instead of MEDIAN 
        next
      end
    end



     #collect values of ticket ID and stores in array
    @tamiMetrics.collect do |value|
      @tamiMetricID << value["tick_id"]
    end

    @tamiMetricIDString = @tamiMetricID.map(&:to_s)
    @tamiMetricIDHash = {}.compare_by_identity
    @tamiMetricIDString.each_with_index{|k,v| @tamiMetricIDHash[k] = v}

    #assigning data from instance variables to easy-to-understand variables for doing maths. 
    
    tamireplyTimeDuringCalendarHours = @tamiMetricsCalendarValues
    tamireplyTimeDuringBusinessHours = @tamiMetricsBusinessValues

    #for calculating MEAN uncomment the below
    $tamirtch = tamireplyTimeDuringCalendarHours.instance_eval { reduce(:+) / size.to_f } 
    $tamirtbh = tamireplyTimeDuringBusinessHours.instance_eval { reduce(:+) / size.to_f }

    #$tamirtch = replyTimeDuringCalendarHours
    #$tamirtbh = replyTimeDuringBusinessHours

  #this calculates the MEDIAN and returns it
=begin
  def median(array)
    sorted = array.sort
    len = sorted.length
    return (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
  end
=end 

  $tamiBusinessHours = $tamirtbh
  $tamiCalendarHours = $tamirtch


#@metricsTimes << @metricIDHash


#print @metricsTimes

  CSV.open("tamiReplyTimeData.csv", "wb") do |csv|
   
    csv << @tamiMetricsTimes.first.keys # adds the attributes name on the first line
    @tamiMetricsTimes.each do |hash|
      csv << hash.values
    end
    @tamiMetricIDHash.each_with_index do |hash|
      csv << hash
    end
  end

=begin
i = 0

CSV.parse("tamiTimes.csv") do |row| 

    new_csv = CSV.open("tamiTimesJoined.csv", "wb") do |new_csv| 
        new_csv << row + [@metricIDHash[i]]
        i += 1
    end 
    
    print new_csv
end 
=end 
  

 




