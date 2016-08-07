class RollCommand
  def initialize
    @rand = Random.new
  end

  def help(event)
    event.respond("Usage: `!roll [x]d[y]`")
  end

  def call(event, args)
    if args.join(" ") =~ /(\d+)d(\d+)/
      rolls = []
      $~[1].to_i.times do 
        rolls << @rand.rand($~[2].to_i) + 1
      end
      sum = rolls.reduce(0, :+)
      event.respond("**#{sum}** = #{rolls.join(" + ")}")
    else
      event.respond("I don't understand that format.")
    end
  end
end