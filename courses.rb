# Read the midterm1 and midterm2

midterm = Array.new(4){ Array.new(4,0) } # 4 rows for courses , 4 columns for coursename , mt1 , mt2 and mt_ave
File.readlines('midterms.txt').each_with_index do|line,idx|
  mt_list = line.chomp.split(' ')
  # Merge into existing array
  midterm[idx][0..mt_list.length - 1] = mt_list 
  end

# Convert from strings to integers.

midterm.each do|g|
  (1..2).each do|i| #  g[0] course name 
    g[i] = g[i].to_i
	end
end

# put and calculate last column as midtherm average
midterm.each do|g|
g[g.length-1] = g[1..g.length-2].reduce(:+) / 2 
end

# Output the mid_term averages
puts "%-14s %4s" % [ "COURSES", "MT_Ave"] # formatted HEADER
midterm.each do|g|
  puts "%-14s %4d" % [ g.first, g.last ] 
end

# **********************   second part *********************

results = Array.new(4){ Array.new(6,0) } # 4 rows , 6 columns
File.readlines('result.txt').each_with_index do|line,idx|
  finallist = line.chomp.split(' ')
  # Merge into existing array
  results[idx][0..finallist.length - 1] = finallist
  end
# Convert from strings to integers.
results.each do|m|
(1..3).each do|i| # m[0] course name
    m[i] = m[i].to_i
	end
end

# formatted HEADER
puts "%-8s %8s %4s %4s %4s %4s" % [ "COURSES" , "FINAL" , "MT_Ave" , "GRADE" , "LETTER" , "PASS/NOT"] 

# importand we use nested .each method to use column of table1 into table2
results.each do |m| 
  midterm.each do |g|
    if m[0]== g[0] # we want to take mt_ave of courses which have SAME NAME
      m[2]= g.last  # last clmn of table1 inserted into 3rd clmn of table2
    end
  end

m[m.length-3] = (m[2]*40/100)+(m[1]*60/100) # grade points : 40% of mt_ave and 60% of final

# use of CASE below to convert grade point to LETTER GRADE
    m[m.length-2] = case m[m.length-3]
    when 0..59
      "FF"
    when 60..69
      "DD"
    when 70..79
      "CC"
    when 80..89
      "BB"
    else
      "AA"
    end

# lastly it calculate to say you PASS the Courses :) or not :(
  if m[m.length-3] >= 70
    m[m.length-1] = "ok"
  end
end # this is "end" of line 49 : results.each do |m|

# and the table :
results.each do|m|
 puts "%-10s %4d %4d %6d %6s %6s " % [ m[0],m[1],m[2],m[3],m[4],m[5]] 
end#puts maas
