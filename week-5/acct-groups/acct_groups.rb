def create_acct_groups(list)

  # Initial solution; calls #allocate on line 4
  # groups = allocate(list.shuffle)

  # Refactored solution;
  # Uses #each_slice(5).to_a to eliminate need for #allocate
  groups = list.shuffle.each_slice(5).to_a
  balance_groups(groups) if groups.length > 1 && groups[-1].length % 5 != 0
  return groups
end


# #allocate method used in initial solution
# def allocate(list)
#   groups = []
#   group = 0
#
#   until list.length <= 0
#     groups << []
#
#     for i in 0..4
#       groups[group][i] = list.shift if list.length > 0
#     end
#
#     group += 1
#   end
#
#   return groups
# end

# Initial #balance_groups;
# Fails on lists of 1, 2, 3, 4, 6, 7, 11
# def balance_groups(groups)
#   shift_member(groups, -2, -1) if groups[-1].length  <= 3
#   shift_member(groups, -3, -1) if groups[-1].length  <= 3
#   shift_member(groups, -4, -1) if groups[-1].length  <= 3
# end


def balance_groups(groups)
  # if groups.flatten.count >= 12
    puts "Balancing groups..."
    shift_member(groups, -2, -1) if groups[-1].length  <= 3
    shift_member(groups, -3, -1) if groups[-1].length  <= 3
    shift_member(groups, -4, -1) if groups[-1].length  <= 3
  #else
  #  shift_member(groups, -2, -1) if groups.flatten.count == 7
#
  #  raise "List has #{groups.flatten.count.to_s} members."
  #end
end


def shift_member(groups, grp_from, grp_to)
  groups[grp_to] << groups[grp_from].pop
end


def print_groups(groups)
  puts
  puts "COPPERHEADS ACCOUNTABILITY GROUPS"
  puts "================================="
  puts "Number of students: " + groups.flatten.length.to_s
  puts "Number of groups: " + groups.length.to_s

  for i in 1..groups.length
    puts "================================="
    puts "Accountability Group " + i.to_s
    puts groups[i-1].length.to_s + " members"
    puts "---------------------------------"
    puts groups[i-1]
    puts
  end
end



copperheads = [
#  "Joshua Abrams", "Syema Ailia", "Kris Bies", "Alexander Blair", "Andrew Blum",
#  "Jacob Boer", "Steven Broderick", "Ovi Calvo", "Danielle Cameron", "Eran Chazan",
#  "Jonathan Chen", "Un Choi", "Kevin Corso", "Eric Dell'Aringa", "Eunice Do",
#  "Ronny Ewanek", "John Paul Chaufan Field", "Eric Freeburg", "Jeff George", "Jamar Gibbs",
#  "Paul Gaston Gouron", "Gabrielle Gustilo", "Marie-France Han", "Noah Heinrich", "Jack Huang",
#  "Max Iniguez", "Mark Janzer", "Michael Jasinski", "Lars Johnson", "Joshua Kim",
#  "James Kirkpatrick", "Christopher Lee", "Isaac Lee", "Joseph Marion", "Kevin Mark",
  "Bernadette Masciocchi", "Bryan Munroe", "Becca Nelson", "Van Phan", "John Polhill",
  "Jeremy Powell", "Jessie Richardson", "David Roberts", "Armani Saldana", "Chris Savage",
  "Parminder Singh", "Kyle Smith", "Aaron Tsai", "Douglas Tsui", "Deanna Warren",
#  "Peter Wiebe",
#  "Daniel Woznicki",
#  "Jay Yee",
  "Nicole Yee",
  "Bruno Zatta"
]

acct_groups = create_acct_groups(copperheads)

print_groups(acct_groups)

