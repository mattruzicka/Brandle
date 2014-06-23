module Write
  def write
    tab
    letters = self.split("")
    space = 0
    letters.each do |letter|
      stutter if letter == ' '
      print letter.black
      $stdout.flush
      sleep [0.04, 0.05, 0.06, 0.07, 0.08].sample
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

  def stutter
    case (1..300).to_a.sample
    when 20 then sleep 0.02
    when 40 then sleep 0.04
    when 60 then sleep 0.06
    when 80 then sleep 0.08
    when 90 then sleep 0.09
    when 100 then sleep 1
    when 110 then sleep 1.1
    when 120 then sleep 1.2
    when 130 then sleep 1.3
    end
  end
  
  def tab
    print "        "
  end
end

