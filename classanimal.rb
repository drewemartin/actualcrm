class Animal
	attr_accessor :legs, :color, :sound

	def walk
		"I'm walking"
	end
	
end

class Mammal < Animal

	def speak
		"woof"
	end

end

class Reptile < Animal

	def speak
		"hiss"
	end
end

lizard = Reptile.new
lizard.color = "green"
lizard.speak

human = Mammal.new
human.color = "fleshtone"
human.speak