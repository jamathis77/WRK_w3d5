class AttrAccessorObject


  def self.my_attr_accessor(*names)
    # names = [:age, :color]
    # define_method(:x) {return *names}

    names.each do |name|
      # name = :age
      define_method(name) do
        self.instance_variable_get("@#{name}")
      end
      # def age(arg1, arg2)
      #   @age
      # end
    end

    names.each do |name|
      define_method("#{name}=") do |rename|
        self.instance_variable_set("@#{name}", rename)
      end
    end

  end
end



#
#
# class Dog < AttrAccessorObject
#    my_attr_accessor :age, :color
#    def initialize(age, color)
#      @age, @color = age, color
#    end
#  end
