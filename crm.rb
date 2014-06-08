class CRM

	attr_accessor :name, :rolodex

	def self.run(name)
		crm = CRM.new(name)
		crm.main_menu
	end

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
			when 4 then display_rolodex_contacts
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
		print "any notes? "
		notes = gets.chomp
		puts "your information is #{first_name}, #{last_name}, #{email_address}, #{notes}"
		# contact_profile = Contact.new(first_name, last_name, email_address, notes)
		# puts contact_profile.inspect
		# puts contact_profile.email
		@rolodex.add_contact(Contact.new(first_name, last_name, email_address, notes))
		main_menu
	end

	def display_rolodex_contacts
		@rolodex.display_contacts
		main_menu
	end

	def delete_contact
	@rolodex.display_contacts
	@rolodex.delete_from_contacts_array
	puts "***** Current Contacts *****"
	@rolodex.display_contacts
	main_menu
	end

	def modify_contact
		@rolodex.display_contacts
		@rolodex.modify_contacts_in_contacts_array
		main_menu
	end

	def display_attribute
		@rolodex.display_contacts
		@rolodex.display_only_attributes
		main_menu
	end
end

class Contact

	attr_accessor :id, :first_name, :last_name, :email_address, :notes

	def initialize (first_name, last_name, email_address, notes)
		@first_name = first_name
		@last_name = last_name
		@email_address = email_address
		@notes = notes

	end

	def to_s
		"#{first_name}, #{last_name}, #{email_address}, #{notes}"
	end

end

class Rolodex
# rolodex.first_name = Josh
	attr_accessor :first_name, :last_name, :email_address, :notes, :id, :contacts
	

	def initialize
		@contacts = []
		@id = 0
	end


	def add_contact(contact)
		contact.id = @id
		@contacts << contact
		@id += 1
	end

	def display_contacts
		@contacts.each do |contact| 
			puts "Contact ID: #{@contacts.index(contact)}"
			puts "First name: " + contact.first_name
			puts "Last name: " + contact.last_name
			puts "Email: " + contact.email_address
			puts "Notes: " + contact.notes
			puts "============================"
		end
	end

	def delete_from_contacts_array
		puts "Please provide the contact ID of the contact you wish to delete"
		id_to_delete = gets.chomp.to_i
		puts "You have chosen contact ID #{id_to_delete} to delete"
		@contacts.delete_at(id_to_delete)
		puts "Contact ID #{id_to_delete} was deleted"
	end

	def modify_contacts_in_contacts_array
		puts "Please provide the contact ID of the contact you wish to modify"
		contact_to_modify = gets.chomp.to_i
		puts "You have chosen contact ID #{contact_to_modify} to modify"
		puts @contacts[contact_to_modify]
		puts "Modification options"
		puts "[1] Modify first name"
		puts "[2] Modify last name"
	  	puts "[3] Modify email"
	  	puts "[4] Modify notes"
	  	part_of_contact_to_modify = gets.chomp.to_i
		  	case part_of_contact_to_modify
		  		when 1 then puts @contacts[contact_to_modify].first_name
		  					puts "What would you like the first name to be?"
		  					new_first_name = gets.chomp
		  					@contacts[contact_to_modify].first_name = new_first_name

		  		when 2 then puts @contacts[contact_to_modify].last_name
		  					puts "What would you like the last name to be?"
		  					new_last_name = gets.chomp
		  					@contacts[contact_to_modify].last_name = new_last_name

		  		when 3 then puts @contacts[contact_to_modify].email_address
		  					puts "What would you like the email address to be?"
		  					new_email_address = gets.chomp
		  					@contacts[contact_to_modify].email_address = new_email_address

		  		when 4 then puts @contacts[contact_to_modify].notes
		  					puts "What would you like the notes to be?"
		  					new_notes = gets.chomp
		  					@contacts[contact_to_modify].notes = new_notes
		  	end
	end

	def display_only_attributes
		puts "Select the attributes you wish to see"
		puts "[1] First name"
		puts "[2] Last name"
	  	puts "[3] Email"
	  	puts "[4] Notes" 
	  	attributes_choice = gets.chomp.to_i
	  	case attributes_choice
	  		when 1 then @contacts.each do |contact|
	  			puts "#{@contacts.index(contact) +1}) #{contact.first_name}"
	  			end
	  	end
	end 
end

CRM.run("drew")




