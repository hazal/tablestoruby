# Read the midterm1 and midterm2
#grades = Array.new(10){ Array.new(10,0) }
midterm = Array.new(4){ Array.new(4,0) } # 4 rows for courses , 4 columns for coursename , mt1 , mt2 and mt_ave
File.readlines('midterms.txt').each_with_index do|line,idx|
  mt_list = line.chomp.split(' ')
#  puts eldenlist [3] # 4. sütunu yazdýrýr <<
#  puts student[2] >> her satırın 3. öğesini yazdırır <<
  # Merge into existing array
  puts midterm.length # >> her satýrýn eleman sayýsýný verir <<
  midterm[idx][0..mt_list.length - 1] = mt_list # kdcc
  end
# puts eldenlist >> hata verir "undefined local variable" ama grades dizi olduðu için mi çýkýyor ? <<
# puts elden[9][11]  #>> 10. satýrýn 12. sütununu verir <<

# Convert from strings to integers. Sayý görünen stringler tamsayý yapýlacak

midterm.each do|g|
  (1..2).each do|i| # 0. eleman isim olduðu için almaık
    g[i] = g[i].to_i
	end
end

#puts elden.length
# toplamý hesapla
midterm.each do|g|
g[g.length-1] = g[1..g.length-2].reduce(:+) / 2 # satýr sonuna bir kolon ekliyor
# puts g  >> yeni oluþturulmuþ son kolon da dahil her satýrý yazdýrýr <<
# puts g.last
end
# Output the final grades
puts "%-14s %4s" % [ "COURSES", "MT_AVE"]
midterm.each do|g|
  puts "%-14s %4d" % [ g.first, g.last ] # adý ve soyadýný verecek þekilde deðiþtir
end
# **********************   second part *********************
results = Array.new(4){ Array.new(6,0) } # 4 rows , 6 columns
File.readlines('result.txt').each_with_index do|line,idx|
  finallist = line.chomp.split(' ')
#  puts eldenlist [3] # 4. sütunu yazdýrýr <<
#  puts student[2] >> her satýrýn 3. öðesini yazdýrýr <<
  # Merge into existing array
#  puts student.length >> her satýrýn eleman sayýsýný verir <<
  results[idx][0..finallist.length - 1] = finallist
 # puts maas
  end
# puts eldenlist >> hata verir "undefined local variable" ama grades dizi olduðu için mi çýkýyor ? <<
# puts maas[9][3]  #>> 10. satýrýn 4. sütununu verir <<
#puts maas
results.each do|m|
(1..3).each do|i| # 0. eleman ÝSÝM olduðu için almadýk
    m[i] = m[i].to_i
	end
end
# puts maas.length
#elden.each do |g|

#elden.each do|g|
  puts "%-8s %8s %4s %4s %4s %4s" % [ "COURSES" , "FINAL" , "MT_Ave" , "GRADE" , "LETTER" , "PASS/NOT"] 
#end


 
results.each do |m| 
#puts m[0]
midterm.each do |g|
#puts g.last
#(0..9).each do|i|
#puts g.last
if m[0]== g[0] # sadece isimler aynı olması durumunda elden alınan tablosunun son kolonunu maaş tablosunda 5. kolona yerleştiriyoruz
m[2]= g.last  # m[2] : maas, m[3]: resmisi , m[4] : elden aldığı
#end
#m[m.length-5] = m[2]-m[4] 
end
end
#puts m[4]
m[m.length-3] = (m[2]*40/100)+(m[1]*60/100) # m[5] : kalan alacağı (maaş - elden aldığı)
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
=begin
if m[m.length-6] <= m[3] # kalanı resmiden az veya eşit ise
	m[m.length-5] = m[m.length-6] # bankaya kalanın tamamı ödenir
	else
	m[m.length-5] = m[3] # yada bankaya resmisi ödenir
	end
	m[m.length-4] = m[m.length-6] - m[m.length-5] # elden alacağı maaş
m[m.length-3] = m[4]+m[6]+m[7]
=end
if m[m.length-3] >= 70
m[m.length-1] = "ok"
end
#if m[m.length-6] < m[m.length-8]
#m[m.length-1] = m[m.length-8] - m[m.length-5]
#end
#puts maas
end
results.each do|m|
 puts "%-10s %4d %4d %6d %6s %6s " % [ m[0],m[1],m[2],m[3],m[4],m[5]] 
end#puts maas
