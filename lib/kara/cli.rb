module Kara
  class CLI

    def initialize
      @evaluator = Evaluator.new
    end

    def run
      while line = Readline.readline(prompt)
        @evaluator.evaluate(line.strip)
      end
    end

    def prompt
      "#{Etc.getlogin}@#{Socket.gethostname}:#{current_dir}$ "
    end

    def current_dir
      Dir.pwd.gsub(/#{Etc.getpwuid.dir}/, '~')
    end
  end
end