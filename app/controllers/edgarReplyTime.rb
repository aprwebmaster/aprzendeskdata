edgarTickets = Ticket.recents.where(:a_id => 2661956646) 
    
    #empty array to store individual tickets in 
    @edgarTicketValues = []

    #extract ticket values from variable and place in array
    edgarTickets.each do |value|
      @edgarTicketValues << value 
    end

    #create empty array to hold zen_id values in 
    @edgarTicketId = []

    #Collect values from edgars ticket's and store the value in zen_id inside array
    @edgarTicketValues.collect do |value|
      @edgarTicketId << value["zen_id"]
    end

    #create empty arrays to hold more values 
    @edgarMetrics = []
    @edgarMetricsCalendarValues = []
    @edgarMetricsBusinessValues = []
    @edgarMetricsTimes = []
    @edgarMetricID = []
    
    #iterates through each zen_id, adds the TicketMetric with matching tick_id to an array 
    @edgarTicketId.each do |value|
      metric = TicketMetric.where(:tick_id => value)
        metric.each do |values|
          @edgarMetrics << values 
        end
      
    end

    #collect values of ticketmetrics and store reply_time_in_minutes within an array.
    @edgarMetrics.collect do |value|
      @edgarMetricsTimes << value["reply_time_in_minutes"]
    end

   
    #extracting the reply time during all hours by storing each ticket's reply time in an array , adding zeros for nil values so averages are accurate. 
    @edgarMetricsTimes.each do |value|

      v = value["calendar"]
      if v != nil
      @edgarMetricsCalendarValues << v 
      else
      #@metricsBusinessValues << 0 include this if calculating MEAN instead of MEDIAN
        next  
      end
    end

    #extracting the reply time during ONLY business hours. Adds zero to the arrays so that averages reflect an accurate time measurement. 
    @edgarMetricsTimes.each do |value|
      b = value["business"]
      if b != nil
      @edgarMetricsBusinessValues << b 
      else
     # @metricsBusinessValues << 0 include this if calculating MEAN instead of MEDIAN 
        next
      end
    end



     #collect values of ticket ID and stores in array
    @edgarMetrics.collect do |value|
      @edgarMetricID << value["tick_id"]
    end

    @edgarMetricIDString = @edgarMetricID.map(&:to_s)
    @edgarMetricIDHash = {}.compare_by_identity
    @edgarMetricIDString.each_with_index{|k,v| @edgarMetricIDHash[k] = v}

    #assigning data from instance variables to easy-to-understand variables for doing maths. 
    
    edgarreplyTimeDuringCalendarHours = @edgarMetricsCalendarValues
    edgarreplyTimeDuringBusinessHours = @edgarMetricsBusinessValues

    #for calculating MEAN uncomment the below
    $edgarrtch = edgarreplyTimeDuringCalendarHours.instance_eval { reduce(:+) / size.to_f } 
    $edgarrtbh = edgarreplyTimeDuringBusinessHours.instance_eval { reduce(:+) / size.to_f }

    #$edgarrtch = replyTimeDuringCalendarHours
    #$edgarrtbh = replyTimeDuringBusinessHours

  #this calculates the MEDIAN and returns it
=begin
  def median(array)
    sorted = array.sort
    len = sorted.length
    return (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
  end
=end 

  $edgarBusinessHours = $edgarrtbh
  $edgarCalendarHours = $edgarrtch


#@metricsTimes << @metricIDHash


#print @metricsTimes

  CSV.open("edgarReplyTimeData.csv", "wb") do |csv|
   
    csv << @edgarMetricsTimes.first.keys # adds the attributes name on the first line
    @edgarMetricsTimes.each do |hash|
      csv << hash.values
    end
    @edgarMetricIDHash.each_with_index do |hash|
      csv << hash
    end
  end

=begin
i = 0

CSV.parse("edgarTimes.csv") do |row| 

    new_csv = CSV.open("edgarTimesJoined.csv", "wb") do |new_csv| 
        new_csv << row + [@metricIDHash[i]]
        i += 1
    end 
    
    print new_csv
end 
=end 
  

 




