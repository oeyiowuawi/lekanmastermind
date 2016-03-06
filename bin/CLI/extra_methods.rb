module ExtraMethods
  def game_exit
    @message.goodbye_message
    system(exit)
  end
end
