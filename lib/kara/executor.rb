module Kara
  class Executor
    def execute(command)
      begin
        out = IO.popen command
        puts out.readlines
      rescue
        puts "#{command}: command not found"
      end
    end
  end
end