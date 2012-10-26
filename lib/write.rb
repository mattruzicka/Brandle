module Write
  def write
    letters = self.split("")
    space = 0
    letters.each do |letter|
      print letter.black
      $stdout.flush
      sleep 0.05
      stutter? # would be cool to pass in some letters, type in wrong letters, then go back and type the right ones. 
      space += 1
      if space > 80 && letter == " "
        print "\n"
        space = 0
      end
    end
    pause_chatter
    return nil
  end

  def pause_chatter
    if (0..1).to_a.sample == 0
      puts " "
      sleep 0.5
      puts " "
    else
      sleep (0..1).to_a.sample
      puts " "
      sleep (0..1).to_a.sample 
      puts " "
      sleep 0.5
    end
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
end