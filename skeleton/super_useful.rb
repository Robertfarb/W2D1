# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue ArgumentError => e
    nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError
  else 
    raise StandardError 
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue CoffeeError => e
    puts e.message
    retry
  end
end  

class CoffeeError < StandardError
  attr_reader :message
  def initialize
    @message = "This is a coffee error"
  end
end

# PHASE 4
class BestFriend
  attr_reader :yrs_known, :name
  
  def initialize(name, yrs_known, fav_pastime)
    @fav_pastime = fav_pastime
    raise ArgumentError.new("Please enter a fav pastime!") if @fav_pastime.length < 1
    @name = name
    raise ArgumentError.new("Please enter a name!") if @name.length < 1
    @yrs_known = yrs_known
    raise ArgumentError.new("Years known is less than 5!") if @yrs_known < 5
  end
  
  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end
  
  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end
  
  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end

if $PROGRAM_NAME == __FILE__
  nigel = BestFriend.new("", 1, "coding")
  # feed_me_a_fruit
end

