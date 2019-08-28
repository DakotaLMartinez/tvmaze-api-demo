module ShowList
  class CLI 
    def start 
      puts "Hey! Welcome to the ShowList CLI"
      @input = nil 
      menu
      while @input != "exit" && @input != "quit"
        get_input(
          valid_choices: ["1","2","menu"],
          error_message: "Whoops! Didn't understand that. Try typing 'menu' to see a list of options.'"
        )
        if @input == "menu"
          menu
        elsif @input == "1"
          print_shows
          prompt_for_show_choice
        elsif @input == "2"
          puts "Print list of networks"
        end
      end
      puts "Thanks for checking out our CLI!!!"
    end

    def menu 
      puts <<-MENU
      1. List Shows 
      2. List Networks 
      type 'help' to see the menu options
      or type 'exit' or 'quit' at any time to leave the program.
      MENU
    end

    def get_input(options)
      @input = gets.strip
      return if @input == "exit" || @input == "quit"
      puts options[:error_message] unless options[:valid_choices].include?(@input)
      @input
    end

    def print_shows 
      Show.all.each.with_index(1) do |show, index|
        puts "#{index}. #{show.name}"
      end
    end

    def prompt_for_show_choice
      while @input != "exit" && @input != "quit" && @input != "back"
        puts "Which show would you like more info about? (type 'list' to see the list again)" 
        puts "type 'back' to return to the main menu or 'exit' to quit"
        @input = gets.chomp
        # make sure that it's valid input before doing this
        index = @input.to_i - 1
        if index >= 0
          puts Show.all[index].summary
        elsif @input == "list"
          print_shows
        end
      end
    end
  end
end