def create_acct_groups(list)
  groups = allocate(list.shuffle)
  balance_groups(groups) if groups[-1].length % 5 != 0
  return groups
end


def allocate(list)
  groups = []
  group = 0

  until list.length <= 0
    groups << []

    for i in 0..4
      groups[group][i] = list.shift if list.length > 0
    end

    group += 1
  end

  return groups
end


def balance_groups(groups)
  shift_member(groups, -2, -1) if groups[-1].length  <= 3
  shift_member(groups, -3, -1) if groups[-1].length  <= 3
  shift_member(groups, -4, -1) if groups[-1].length  <= 3
end


def shift_member(groups, grp_from, grp_to)
  groups[grp_to] << groups[grp_from].pop
end


def print_groups(groups)
  puts
  puts "================================"
  puts "Number of students: " + groups.flatten.length.to_s
  puts "Number of groups: " + groups.length.to_s

  for i in 1..groups.length
    puts "================================"
    puts "Accountability Group " + i.to_s
    puts groups[i-1].length.to_s + " members"
    puts "--------------------------------"
    puts groups[i-1]
    puts
  end
end



copperheads = [
  "Joshua Abrams", "Syema Ailia", "Kris Bies", "Alexander Blair", "Andrew Blum",
  "Jacob Boer", "Steven Broderick", "Ovi Calvo", "Danielle Cameron", "Eran Chazan",
  "Jonathan Chen", "Un Choi", "Kevin Corso", "Eric Dell'Aringa", "Eunice Do",
  "Ronny Ewanek", "John Paul Chaufan Field", "Eric Freeburg", "Jeff George", "Jamar Gibbs",
  "Paul Gaston Gouron", "Gabrielle Gustilo", "Marie-France Han", "Noah Heinrich", "Jack Huang",
  "Max Iniguez", "Mark Janzer", "Michael Jasinski", "Lars Johnson", "Joshua Kim",
  "James Kirkpatrick", "Christopher Lee", "Isaac Lee", "Joseph Marion", "Kevin Mark",
  "Bernadette Masciocchi", "Bryan Munroe", "Becca Nelson", "Van Phan", "John Polhill",
  "Jeremy Powell", "Jessie Richardson", "David Roberts", "Armani Saldana", "Chris Savage",
  "Parminder Singh", "Kyle Smith", "Aaron Tsai", "Douglas Tsui", "Deanna Warren",
  "Peter Wiebe",
  "Daniel Woznicki",
  "Jay Yee",
  "Nicole Yee",
  "Bruno Zatta"
]

acct_groups = create_acct_groups(copperheads)

print_groups(acct_groups)

