module Write
  def write
    tab
    letters = self.split("")
    space = 0
    letters.each do |letter|
      print letter.black
      $stdout.flush
      sleep 0.05
      stutter? 
      space += 1
      if space > 70 && letter == " "
        print "\n"
        tab
        space = 0
      end
    end
    sleep 0.5
    puts "\n"
    sleep 0.5
    puts "\n"
    return nil
  end


  def stutter?
    case (1..300).to_a.sample
    when 20 then sleep 0.02
    when 40 then sleep 0.04
    when 60 then sleep 0.06
    when 80 then sleep 0.08
    when 90 then sleep 0.09
    when 110 then sleep 1.1
    when 130 then sleep 1.2
    end
  end
  
  def tab
    print "        "
  end
end

# name.length.times { |i| $stdout.write "\n\r\r"; sleep 1}

