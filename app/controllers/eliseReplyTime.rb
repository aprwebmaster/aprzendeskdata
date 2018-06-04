eliseTickets = Ticket.recents.where(:a_id => 1410567703) 
    
    #empty array to store individual tickets in 
    @eliseTicketValues = []

    #extract ticket values from variable and place in array
    eliseTickets.each do |value|
      @eliseTicketValues << value 
    end

    #create empty array to hold zen_id values in 
    @eliseTicketId = []

    #Collect values from edgars ticket's and store the value in zen_id inside array
    @eliseTicketValues.collect do |value|
      @eliseTicketId << value["zen_id"]
    end

    #create empty arrays to hold more values 
    @eliseMetrics = []
    @eliseMetricsCalendarValues = []
    @eliseMetricsBusinessValues = []
    @eliseMetricsTimes = []
    @eliseMetricID = []

    #iterates through each zen_id, adds the TicketMetric with matching tick_id to an array 
    @eliseTicketId.each do |value|
      metric = TicketMetric.where(:tick_id => value)
        metric.each do |values|
          @eliseMetrics << values 
        end
      
    end

    #collect values of ticketmetrics and store reply_time_in_minutes within an array.
    @eliseMetrics.collect do |value|
      @eliseMetricsTimes << value["reply_time_in_minutes"]
    end

   
    #extracting the reply time during all hours by storing each ticket's reply time in an array , adding zeros for nil values so averages are accurate. 
    @eliseMetricsTimes.each do |value|

      v = value["calendar"]
      if v != nil
      @eliseMetricsCalendarValues << v 
      else
      #@metricsBusinessValues << 0 include this if calculating MEAN instead of MEDIAN
        next  
      end
    end

    #extracting the reply time during ONLY business hours. Adds zero to the arrays so that averages reflect an accurate time measurement. 
    @eliseMetricsTimes.each do |value|
      b = value["business"]
      if b != nil
      @eliseMetricsBusinessValues << b 
      else
     # @metricsBusinessValues << 0 include this if calculating MEAN instead of MEDIAN 
        next
      end
    end

     #collect values of ticket ID and stores in array
    @eliseMetrics.collect do |value|
      @eliseMetricID << value["tick_id"]
    end


    @eliseMetricIDString = @eliseMetricID.map(&:to_s)
    @eliseMetricIDHash = {}.compare_by_identity
    @eliseMetricIDString.each_with_index{|k,v| @eliseMetricIDHash[k] = v}

    #assigning data from instance variables to easy-to-understand variables for doing maths. 
    
    elisereplyTimeDuringCalendarHours = @eliseMetricsCalendarValues
    elisereplyTimeDuringBusinessHours = @eliseMetricsBusinessValues

    #for calculating MEAN uncomment the below
    $elisertch = elisereplyTimeDuringCalendarHours.instance_eval { reduce(:+) / size.to_f } 
    $elisertbh = elisereplyTimeDuringBusinessHours.instance_eval { reduce(:+) / size.to_f }

    #For calculating MEDIAN use the below 
    #$elisertch = replyTimeDuringCalendarHours
    #$elisertbh = replyTimeDuringBusinessHours
=begin
  #this calculates the MEDIAN and returns it
  def median(array)
    sorted = array.sort
    len = sorted.length
    return (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
  end
=end 

  $eliseBusinessHours = $elisertbh
  $eliseCalendarHours = $elisertch


  CSV.open("eliseReplyTimeData.csv", "wb") do |csv|
   
    csv << @eliseMetricsTimes.first.keys # adds the attributes name on the first line
    @eliseMetricsTimes.each do |hash|
      csv << hash.values
    end
    @eliseMetricIDHash.each_with_index do |hash|
      csv << hash
    end
  end

