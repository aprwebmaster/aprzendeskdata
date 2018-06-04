
    morganTickets = Ticket.recents.where(:a_id => 360435687346) 
    
    #empty array to store individual tickets in 
    @morganTicketValues = []

    #extract ticket values from variable and place in array
    morganTickets.each do |value|
      @morganTicketValues << value 
    end

    #create empty array to hold zen_id values in 
    @morganTicketId = []

    #Collect values from edgars ticket's and store the value in zen_id inside array
    @morganTicketValues.collect do |value|
      @morganTicketId << value["zen_id"]
    end

    #create empty arrays to hold more values 
    @morganMetrics = []
    @morganMetricsCalendarValues = []
    @morganMetricsBusinessValues = []
    @morganMetricsTimes = []
    @morganMetricID = []
    
    #iterates through each zen_id, adds the TicketMetric with matching tick_id to an array 
    @morganTicketId.each do |value|
      metric = TicketMetric.where(:tick_id => value)
        metric.each do |values|
          @morganMetrics << values 
        end
      
    end

    #collect values of ticketmetrics and store reply_time_in_minutes within an array.
    @morganMetrics.collect do |value|
      @morganMetricsTimes << value["reply_time_in_minutes"]
    end

   
    #extracting the reply time during all hours by storing each ticket's reply time in an array , adding zeros for nil values so averages are accurate. 
    @morganMetricsTimes.each do |value|

      v = value["calendar"]
      if v != nil
      @morganMetricsCalendarValues << v 
      else
      #@morganMetricsBusinessValues << 0 include this if calculating MEAN instead of MEDIAN
        next  
      end
    end

    #extracting the reply time during ONLY business hours. Adds zero to the arrays so that averages reflect an accurate time measurement. 
    @morganMetricsTimes.each do |value|
      b = value["business"]
      if b != nil
      @morganMetricsBusinessValues << b 
      else
     # @morganMetricsBusinessValues << 0 include this if calculating MEAN instead of MEDIAN 
        next
      end
    end

     #collect values of ticket ID and stores in array
    @morganMetrics.collect do |value|
      @morganMetricID << value["tick_id"]
    end


    @morganMetricIDString = @morganMetricID.map(&:to_s)
    @morganMetricIDHash = {}.compare_by_identity
    @morganMetricIDString.each_with_index{|k,v| @morganMetricIDHash[k] = v}


    #assigning data from instance variables to easy-to-understand variables for doing maths. 
    
    morganreplyTimeDuringCalendarHours = @morganMetricsCalendarValues
    morganreplyTimeDuringBusinessHours = @morganMetricsBusinessValues

    #for calculating MEAN uncomment the below
    $morganrtch = morganreplyTimeDuringCalendarHours.instance_eval { reduce(:+) / size.to_f } 
    $morganrtbh = morganreplyTimeDuringBusinessHours.instance_eval { reduce(:+) / size.to_f }

    #$morganrtch = morganreplyTimeDuringCalendarHours
    #$morganrtbh = morganreplyTimeDuringBusinessHours

=begin
  #this calculates the MEDIAN and returns it
  def median(array)
    sorted = array.sort
    len = sorted.length
    return (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
  end
=end

  $morganBusinessHours = $morganrtbh
  $morganCalendarHours = $morganrtch



  CSV.open("morganReplyTimeData.csv", "wb") do |csv|
   
    csv << @morganMetricsTimes.first.keys # adds the attributes name on the first line
    @morganMetricsTimes.each do |hash|
      csv << hash.values
    end
    @morganMetricIDHash.each_with_index do |hash|
      csv << hash
    end
  end
