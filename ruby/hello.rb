class Greeter
    def initialize(say = "Hi!kiyomaru")
        @greet = say
    end
    def say_hello()
        puts @greet
    end
end

if __FILE__ == $0
    # create instance
    greeter = Greeter.new("hello")
    # call method
    greeter.say_hello
end