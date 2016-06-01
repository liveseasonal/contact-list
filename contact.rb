require 'csv'
require 'pry'

# Represents a person in an address book.
# The ContactList class will work with Contact objects instead of interacting with the CSV file directly
class Contact

  attr_accessor :id, :name, :email
  
  # Creates a new contact object
  # @param name [String] The contact's name
  # @param email [String] The contact's email address
  def initialize(id, name, email)
    # TODO: Assign parameter values to instance variables.
    @id = id
    @name = name
    @email = email
  end

    def to_s
      "#{@id} #{@name} #{@email} "
    end 

  # Provides functionality for managing contacts in the csv file.
  class << self

    

    # Opens 'contacts.csv' and creates a Contact object for each line in the file (aka each contact).
    # @return [Array<Contact>] Array of Contact objects
    def all
      # TODO: Return an Array of Contact instances made from the data in 'contacts.csv'.
      # CSV.read('contacts.csv')
      contacts = []
      CSV.foreach('contacts.csv') do |row|
        contacts << Contact.new(row[0], row[1], row[2])
        # puts row.inspect
      end  
      contacts     
    end

    # Creates a new contact, adding it to the csv file, returning the new contact.
    # @param name [String] the new contact's name
    # @param email [String] the contact's email
    def create(name, email)
      # TODO: Instantiate a Contact, add its data to the 'contacts.csv' file, and return it.
      
      contact_array = CSV.read('contacts.csv')
      new_row_index = contact_array.last[0].to_i + 1
      contact = Contact.new(new_row_index,name, email)
      CSV.open('contacts.csv', 'a') do |csv_object|
        csv_object << [new_row_index, contact.name, contact.email]  
      end
     contact
    end
    
    # Find the Contact in the 'contacts.csv' file with the matching id.
    # @param id [Integer] the contact id
    # @return [Contact, nil] the contact with the specified id. If no contact has the id, returns nil.
    def find(id)
      # TODO: Find the Contact in the 'contacts.csv' file with the matching id.
      CSV.foreach('contacts.csv') do |row|
        # binding.pry
        if id == row[0]
          contact = Contact.new(row[0], row[1], row[2])
         # binding.pry
          return contact 

        end
         
      end    
      nil
    end
    
    # Search for contacts by either name or email.
    # @param term [String] the name fragment or email fragment to search for
    # @return [Array<Contact>] Array of Contact objects.
    def search(term)

      #Figure out what to do with term and how to take input


      # TODO: Select the Contact instances from the 'contacts.csv' file whose name or email attributes contain the search term.
      CSV.foreach('contacts.csv') do |row|
        # binding.pry
        if term == row[1] || row[2]
          contact = Contact.new(row[0], row[1], row[2])
         # binding.pry
          return contact 

        end
         
      end    
      nil

    end

  end

end

# puts "What is your full name: "
#         @name = gets.chomp
#         puts "What is your email address"
#         @email = gets.chomp

# new_contact = Contact.new(1, "Matt", "matt@liveseasonal.com")
# puts new_contact.email