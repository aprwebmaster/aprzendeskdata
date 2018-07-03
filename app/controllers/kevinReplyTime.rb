kevinTickets = Ticket.recents.where(:a_id => 366090116592) 
    
    #empty array to store individual tickets in 
    @kevinTicketValues = []

    #extract ticket values from variable and place in array
    kevinTickets.each do |value|
      @kevinTicketValues << value 
    end

    #create empty array to hold zen_id values in 
    @kevinTicketId = []

    #Collect values from kevins ticket's and store the value in zen_id inside array
    @kevinTicketValues.collect do |value|
      @kevinTicketId << value["zen_id"]
    end

    #create empty arrays to hold more values 
    @kevinMetrics = []
    @kevinMetricsCalendarValues = []
    @kevinMetricsBusinessValues = []
    @kevinMetricsTimes = []
    @kevinMetricID = []
    
    #iterates through each zen_id, adds the TicketMetric with matching tick_id to an array 
    @kevinTicketId.each do |value|
      metric = TicketMetric.where(:tick_id => value)
        metric.each do |values|
          @kevinMetrics << values 
        end
      
    end

    #collect values of ticketmetrics and store reply_time_in_minutes within an array.
    @kevinMetrics.collect do |value|
      @kevinMetricsTimes << value["reply_time_in_minutes"]
    end

   
    #extracting the reply time during all hours by storing each ticket's reply time in an array , adding zeros for nil values so averages are accurate. 
    @kevinMetricsTimes.each do |value|

      v = value["calendar"]
      if v != nil
      @kevinMetricsCalendarValues << v 
      else
      #@metricsBusinessValues << 0 include this if calculating MEAN instead of MEDIAN
        next  
      end
    end

    #extracting the reply time during ONLY business hours. Adds zero to the arrays so that averages reflect an accurate time measurement. 
    @kevinMetricsTimes.each do |value|
      b = value["business"]
      if b != nil
      @kevinMetricsBusinessValues << b 
      else
     # @metricsBusinessValues << 0 include this if calculating MEAN instead of MEDIAN 
        next
      end
    end



     #collect values of ticket ID and stores in array
    @kevinMetrics.collect do |value|
      @kevinMetricID << value["tick_id"]
    end

    @kevinMetricIDString = @kevinMetricID.map(&:to_s)
    @kevinMetricIDHash = {}.compare_by_identity
    @kevinMetricIDString.each_with_index{|k,v| @kevinMetricIDHash[k] = v}

    #assigning data from instance variables to easy-to-understand variables for doing maths. 
    
    kevinreplyTimeDuringCalendarHours = @kevinMetricsCalendarValues
    kevinreplyTimeDuringBusinessHours = @kevinMetricsBusinessValues

    #for calculating MEAN uncomment the below
    $kevinrtch = kevinreplyTimeDuringCalendarHours.instance_eval { reduce(:+) / size.to_f } 
    $kevinrtbh = kevinreplyTimeDuringBusinessHours.instance_eval { reduce(:+) / size.to_f }

    #$kevinrtch = replyTimeDuringCalendarHours
    #$kevinrtbh = replyTimeDuringBusinessHours

  #this calculates the MEDIAN and returns it
=begin
  def median(array)
    sorted = array.sort
    len = sorted.length
    return (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
  end
=end 

  $kevinBusinessHours = $kevinrtbh
  $kevinCalendarHours = $kevinrtch


#@metricsTimes << @metricIDHash


#print @metricsTimes

  CSV.open("kevinReplyTimeData.csv", "wb") do |csv|
   
    csv << @kevinMetricsTimes.first.keys # adds the attributes name on the first line
    @kevinMetricsTimes.each do |hash|
      csv << hash.values
    end
    @kevinMetricIDHash.each_with_index do |hash|
      csv << hash
    end
  end

=begin
i = 0

CSV.parse("kevinTimes.csv") do |row| 

    new_csv = CSV.open("kevinTimesJoined.csv", "wb") do |new_csv| 
        new_csv << row + [@metricIDHash[i]]
        i += 1
    end 
    
    print new_csv
end 
=end 
  

 




