class CRM

	#attr_accessor :name

	def initialize(name)
		@name = name
		@rolodex = Rolodex.new
	end

	def print_main_menu
		# print stuff
		# get stuff
		# do stuff with stuff
		puts "[1] Add a new contact"
		puts "[2] Modify an existing contact"
	  	puts "[3] Delete a contact"
	  	puts "[4] Display all the contacts"
	  	puts "[5] Display an attribute"
	  	puts "[6] Exit"
	  	puts "Enter a number: "
	end

	def main_menu
		puts "welcom to #{@name}'s CRM"
		print_main_menu #this is an instance of another method in a method. it will print all the puts options
		selection = gets.chomp.to_i
		call_option(selection)
	end

	def call_option(selection)
		case selection
		when 1 then add_new_contact #working on
		when 2 then modify_contact
		when 3 then delete_contact
		when 4 then display_contacts
		when 5 then display_attribute
		when 6
			puts "Goodbye"
			return
		else
			puts "Invalid option. Please use valid selection"
			main_menu
		end	
	end

	def add_new_contact
		print "What is your first name: "
		first_name = gets.chomp
		print "what is your last name: "
		last_name = gets.chomp
		print "what is your email address: "
		email_address = gets.chomp
		print "any notes?"
		notes = gets.chomp
		puts "your information is #{first_name}, #{last_name}, #{email_address}, #{notes}"
		puts first_name + last_name + email_address + notes
		contact_profile = Contact.new(first_name, last_name, email_address, notes)
		puts contact_profile.inspect
		@rolodex.add_contact(contact_profile)
		main_menu

	end

	def modify_contact
		puts "to verify your account please provide your email address"
		id_verification = gets.chomp.downcase
		@rolodex.contacts.each do |contact|
			if contact.email_address == 'poop@poop.com'
				puts "hooray"
			end
		end
	end



end

class Contact

	attr_accessor :id

	def initialize (first_name, last_name, email_address, notes)
		@first_name = first_name
		@last_name = last_name
		@email_address = email_address
		@notes = notes
		@id = 0
	end
end

class Rolodex

	attr_accessor :contacts

	def initialize
		@contacts = []
		@id = 0
	end



	def add_contact(contact)
		contact.id = @id
		@contacts << contact
		@id += 1
	end
end

h = CRM.new("drew")
h.main_menu



