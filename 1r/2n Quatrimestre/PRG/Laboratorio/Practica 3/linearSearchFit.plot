set xrange [0:110000] 
set yrange [-10:]
set xtics 20000
set ytics 10 
set xlabel "Size"
set ylabel "Microseconds"
set key left
set grid

#set term pdf colour enhanced solid
#set output "linearSearch.pdf"

f(x) = a*x+b
g(x) = c*x+d
fit f(x) "linearSearch.out" using 1:3 via a,b
fit g(x) "linearSearch.out" using 1:4 via c,d

plot "linearSearch.out" using 1:2 title "Best case" with points, \
     "linearSearch.out" using 1:3 title "Worst case" with points, \
     "linearSearch.out" using 1:4 title "Average case" with points, \
     f(x) with lines, g(x) with lines


print "f(", 10**9, ") = ", f(10**9)
print "g(", 10**9, ") = ", g(10**9)
