require_relative 'contact'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList

  # TODO: Implement user interaction. This should be the only file where you use `puts` and `gets`.
  


     # userSelection = response

  def menu_prompt
    if ARGV[0]
      case ARGV[0] 
      when "new"
        Contact.create("Olga", "olga@russia.com")
        Contact.create("Kate", "kate@latvia.com")
        Contact.create("Irina", "hannah@germany.com")
      when "list"
        #the puts here calls the to_s as it is coverting the object to a string. We have over ridden this and thus are new shape takes affect
        puts Contact.all
      when "show"
       puts Contact.find("2")
      when "search"
        # puts "Please give us a term"
        # term = gets.chomp
        puts Contact.search(term)
      when "update"
        puts "edit a contact" 
      when "delete"
        puts "delete a contact"
      else
        puts "entire menu"
      end
    else
      puts "Here is alist of available commands:
      new     -Create a new contact
      list    - List all contacts
      show    - Show a contact
      search  - Search contacts"
    end
  end
end

ContactList.new.menu_prompt
# new_contact.makeaselection

# Matt Oakes, matt@liveseasonal.com
# Alicia Whitelaw, alicia@bycclothing.com
# Marc Whitelaw, marc@byccollective.com