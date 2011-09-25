module Kara
  class CLI

    def initialize
      @evaluator = Evaluator.new
    end

    def run
      print prompt
      STDIN.each_line do |line|
        @evaluator.evaluate(line.strip)
        print prompt
      end
    end

    def prompt
      "#{Etc.getlogin}@#{Socket.gethostname}:#{Dir.pwd}$ "
    end
    
  end
end