# Read the grades
#grades = Array.new(10){ Array.new(10,0) }
elden = Array.new(25){ Array.new(34,0) } # 25 satýrlýk 34 sütunluk tablo
File.readlines('rbtext12.txt').each_with_index do|line,idx|
  eldenlist = line.chomp.split(' ')
#  puts eldenlist [3] # 4. sütunu yazdýrýr <<
#  puts student[2] >> her satýrýn 3. öðesini yazdýrýr <<
  # Merge into existing array
#  puts student.length >> her satýrýn eleman sayýsýný verir <<
  elden[idx][0..eldenlist.length - 1] = eldenlist
  end
# puts eldenlist >> hata verir "undefined local variable" ama grades dizi olduðu için mi çýkýyor ? <<
# puts elden[9][11]  #>> 10. satýrýn 12. sütununu verir <<

# Convert from strings to integers. Sayý görünen stringler tamsayý yapýlacak

elden.each do|g|
  (2..32).each do|i| # 0. eleman ÝSÝM olduðu için almadýk
    g[i] = g[i].to_i
	end
end

#puts elden.length
# toplamý hesapla
elden.each do|g|
g[g.length-1] = g[2..g.length-2].reduce(:+)  # satýr sonuna bir kolon ekliyor
# puts g  >> yeni oluþturulmuþ son kolon da dahil her satýrý yazdýrýr <<
# puts g.last
end
# Output the final grades
elden.each do|g|
  puts "%-14s %4d" % [ g.first, g.last ] # adý ve soyadýný verecek þekilde deðiþtir
end
# **********************   ikinci kýsým *********************
maas = Array.new(25){ Array.new(11,0) } # 25 satýrlýk 10 sütunluk tablo
File.readlines('maas.txt').each_with_index do|line,idx|
  maaslist = line.chomp.split(' ')
#  puts eldenlist [3] # 4. sütunu yazdýrýr <<
#  puts student[2] >> her satýrýn 3. öðesini yazdýrýr <<
  # Merge into existing array
#  puts student.length >> her satýrýn eleman sayýsýný verir <<
  maas[idx][0..maaslist.length - 1] = maaslist
 # puts maas
  end
# puts eldenlist >> hata verir "undefined local variable" ama grades dizi olduðu için mi çýkýyor ? <<
# puts maas[9][3]  #>> 10. satýrýn 4. sütununu verir <<
#puts maas
maas.each do|m|
(2..3).each do|i| # 0. eleman ÝSÝM olduðu için almadýk
    m[i] = m[i].to_i
	end
end
# puts maas.length
#elden.each do |g|

#elden.each do|g|
  puts "%-8s %8s %4s %4s %4s %4s %4s %4s %4s %4s %8s " % [ "ADI" , "SOYADI" , "MAASI" , "BORDRO" , "ELDEN" , "KALAN" ,"BANKAYA" , "ELDEN2" , "toplam", "ok" , "tediye" ] 
#end


 
maas.each do |m| 
#puts m[0]
elden.each do |g|
#puts g.last
#(0..9).each do|i|
#puts g.last
if m[0]== g[0] # sadece isimler aynı olması durumunda elden alınan tablosunun son kolonunu maaş tablosunda 5. kolona yerleştiriyoruz
m[4]= g.last  # m[2] : maas, m[3]: resmisi , m[4] : elden aldığı
#end
#m[m.length-5] = m[2]-m[4] 
end
end
#puts m[4]
m[m.length-6] = m[2]-m[4] # m[5] : kalan alacağı (maaş - elden aldığı)
if m[m.length-6] <= m[3] # kalanı resmiden az veya eşit ise
	m[m.length-5] = m[m.length-6] # bankaya kalanın tamamı ödenir
	else
	m[m.length-5] = m[3] # yada bankaya resmisi ödenir
	end
	m[m.length-4] = m[m.length-6] - m[m.length-5] # elden alacağı maaş
m[m.length-3] = m[4]+m[6]+m[7]
if m[m.length-3] == m[2]
m[m.length-2] = "ok"

end
if m[m.length-6] < m[m.length-8]
m[m.length-1] = m[m.length-8] - m[m.length-5]
end
#puts maas
end
maas.each do|m|
 puts "%-8s %8s %4d %4d %6d %6d %6d %6d %6d %6s %8d " % [ m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10]] 
end#puts maas
