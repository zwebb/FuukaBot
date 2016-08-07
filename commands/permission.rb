require_relative "command.rb"

class PermissionCommand < Command
  def initialize(bot)
    super()
    @bot = bot
    @plevel = 2
    @usage = "[command]"
  end

  def call(event, args)
    command = args[0].to_sym

    if @bot.commands.has_key?(command)
      command_obj = @bot.commands[command]
      @modifier = @should_restrict ? 1 : -1
      event.respond("Command `!#{command}`'s permissions #{@bot.commands[command].modify_plevel(@modifier)}")
    else
      event.respond("I don't know that command.")
    end
  end
end