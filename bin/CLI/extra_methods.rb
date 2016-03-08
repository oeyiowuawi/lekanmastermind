module ExtraMethods
  def game_exit
    puts @message.goodbye
    system(exit)
  end
end
