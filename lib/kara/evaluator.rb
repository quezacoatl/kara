module Kara
  class Evaluator

    def initialize
      @context = binding
      @executor = Executor.new
      @aliases = {}
      @aliases['cd'] = 'Dir.chdir \'#{cmd_split[1]}\''
    end

    def evaluate(command)
      begin
        cmd_split = command.split(' ')
        alias_cmd = @aliases[cmd_split[0]]
        if alias_cmd
          command = eval('"' + alias_cmd + '"')
        end
        out = eval(command, @context)
        puts out
      rescue Exception => exc
        command = eval('"' + command + '"', @context)
        @executor.execute(command)
      end
    end
  end
end