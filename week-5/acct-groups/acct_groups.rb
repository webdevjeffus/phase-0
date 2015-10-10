def create_acct_groups(list)

  list = list.shuffle

  if list.length % 5 == 0
    groups = allocate(list)

  else
    groups = allocate(list)
    balance_groups(groups)
  end


end


def allocate(list)

  groups = []
  group = 0

  until list.length == 0
    groups << []

    for i in 0..4
      if list.length > 0
        groups[group][i] = list.shift
      end
    end


    group += 1

  end
  return groups

end


def balance_groups(groups)

  if groups[-1].length  == 3
    groups[-1] << groups[-2].pop
  elsif groups[-1].length == 2
    groups[-1] << groups[-2].pop
    groups[-1] << groups[-3].pop
  elsif groups[-1].length == 1
    groups[-1] << groups[-2].pop
    groups[-1] << groups[-3].pop
    groups[-1] << groups[-4].pop
  else # groups % 5 == 4, leave groups as is
  end

  return groups

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

puts
puts "================================"
puts "Number of students: " + copperheads.length.to_s
puts "Number of groups: " + acct_groups.length.to_s

for i in 1..acct_groups.length
  puts "================================"
  puts "Accountability Group " + i.to_s
  puts acct_groups[i-1].length.to_s + " members"
  puts "--------------------------------"
  puts acct_groups[i-1]
  puts
end
