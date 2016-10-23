
    class Game
    
        attr_reader :guess_count, :is_over, :word_length, :progress
    
        def initialize (secret_word)
            @secret_word = secret_word
            @guess_count = 0 
            @is_over = false 
            @word_length = secret_word.length
            @progress = ""
            1.upto(secret_word.length) do
                @progress << "_"
            end 
        end 
    
        def check_word(guess)
            if @secret_word == guess 
                puts "Congratulations!"
                @is_over = true 
            else 
                @is_over = false
                puts "Sorry, try again!"
            end 
        end 
    
        def check_letter (guess)
            if (@secret_word[guess])
                for i in 0..((@secret_word.length) -1 )
                    if @secret_word[i] == guess
                        @progress[i] = guess 
                    end
                end
            end
            show_progress
            check_word(@progress)    
        end
    
        def show_progress
            array = @progress.split(//)
            word = ""
            array.each  do |letter|
                word << letter + " "
            end
            puts word 
        end
       
        def one_less_guess
            @guess_count += 1
        end
         
        def subtract_guess_count
            counter = @word_length - @guess_count
        end 
    end
    
    puts "User 1, What is your secret word?"
    secret_word = gets.chomp
    
    anything = Game.new(secret_word)
    
    while !anything.is_over
        puts "User 2, Guess the secret word"
        guess = gets.chomp
        anything.one_less_guess
        if guess.length == 1
            anything.check_letter(guess)
        else
            anything.check_word(guess)
        end
        if anything.subtract_guess_count == 0
            puts "You lose! the correct word was #{secret_word}"
            exit!
        end 
        if anything.is_over == false
            puts "You have #{anything.subtract_guess_count} left!"
        end 
    end


