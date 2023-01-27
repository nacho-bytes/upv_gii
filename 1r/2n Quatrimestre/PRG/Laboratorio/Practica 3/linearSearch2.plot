set xrange [0:110000] 
set yrange [-10:]
set xtics 20000
set ytics 10 
set xlabel "Size"
set ylabel "Microseconds"
set key left
set grid

set term pdf colour enhanced solid
set output "linearSearch.pdf"

plot "linearSearch.out" using 1:2 title "Best case" with points, \
     "linearSearch.out" using 1:3 title "Worst case" with points, \
     "linearSearch.out" using 1:4 title "Average case" with points
