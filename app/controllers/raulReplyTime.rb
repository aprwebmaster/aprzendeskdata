raulTickets = Ticket.recents.where(:a_id => 360303091423) 
    
    #empty array to store individual tickets in 
    @raulTicketValues = []

    #extract ticket values from variable and place in array
    raulTickets.each do |value|
      @raulTicketValues << value 
    end

    #create empty array to hold zen_id values in 
    @raulTicketId = []

    #Collect values from edgars ticket's and store the value in zen_id inside array
    @raulTicketValues.collect do |value|
      @raulTicketId << value["zen_id"]
    end

    #create empty arrays to hold more values 
    @raulMetrics = []
    @raulMetricsCalendarValues = []
    @raulMetricsBusinessValues = []
    @raulMetricsTimes = []
    @raulMetricID = []
    
    #iterates through each zen_id, adds the TicketMetric with matching tick_id to an array 
    @raulTicketId.each do |value|
      metric = TicketMetric.where(:tick_id => value)
        metric.each do |values|
          @raulMetrics << values 
        end
      
    end

    #collect values of ticketmetrics and store reply_time_in_minutes within an array.
    @raulMetrics.collect do |value|
      @raulMetricsTimes << value["reply_time_in_minutes"]
    end

   
    #extracting the reply time during all hours by storing each ticket's reply time in an array , adding zeros for nil values so averages are accurate. 
    @raulMetricsTimes.each do |value|

      v = value["calendar"]
      if v != nil
      @raulMetricsCalendarValues << v 
      else
      #@metricsBusinessValues << 0 include this if calculating MEAN instead of MEDIAN
        next  
      end
    end

    #extracting the reply time during ONLY business hours. Adds zero to the arrays so that averages reflect an accurate time measurement. 
    @raulMetricsTimes.each do |value|
      b = value["business"]
      if b != nil
      @raulMetricsBusinessValues << b 
      else
     # @metricsBusinessValues << 0 include this if calculating MEAN instead of MEDIAN 
        next
      end
    end

     #collect values of ticket ID and stores in array
    @raulMetrics.collect do |value|
      @raulMetricID << value["tick_id"]
    end


    @raulMetricIDString = @raulMetricID.map(&:to_s)
    @raulMetricIDHash = {}.compare_by_identity
    @raulMetricIDString.each_with_index{|k,v| @raulMetricIDHash[k] = v}

    
    #assigning data from instance variables to easy-to-understand variables for doing maths. 
    
    raulreplyTimeDuringCalendarHours = @raulMetricsCalendarValues
    raulreplyTimeDuringBusinessHours = @raulMetricsBusinessValues

    #for calculating MEAN uncomment the below
    $raulrtch = raulreplyTimeDuringCalendarHours.instance_eval { reduce(:+) / size.to_f } 
    $raulrtbh = raulreplyTimeDuringBusinessHours.instance_eval { reduce(:+) / size.to_f }

    #For Calculating MEDIAN uncomment the below 
    #$raulrtch = replyTimeDuringCalendarHours
    #$raulrtbh = replyTimeDuringBusinessHours
=begin
  #this calculates the MEDIAN and returns it
  def median(array)
    sorted = array.sort
    len = sorted.length
    return (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
  end
=end
  $raulBusinessHours = $raulrtbh
  $raulCalendarHours = $raulrtch



  CSV.open("raulReplyTimeData.csv", "wb") do |csv|
   
    csv << @raulMetricsTimes.first.keys # adds the attributes name on the first line
    @raulMetricsTimes.each do |hash|
      csv << hash.values
    end
    @raulMetricIDHash.each_with_index do |hash|
      csv << hash
    end
  end


