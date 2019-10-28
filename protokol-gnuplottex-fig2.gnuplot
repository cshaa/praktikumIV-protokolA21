set terminal epslatex color
set output 'protokol-gnuplottex-fig2.tex'

        set xlabel "$\\varphi$ [\°]"
        set ylabel "N"
        set xrange [40:140]
        set yrange [0:80]
        load 'lines.cfg'
        set key left bottom
        set key box vertical width 1 height 1 maxcols 0.3 spacing 1

        plot \
            'data2' using 1:($3 == 0 ? $2 : 1/0) \
                ps 3 lc palette cb 0 title "nestíněný", \
            \
            'data2' using 1:($3 == 1 ? $2 : 1/0) \
                ps 3 lc palette cb 1 title "stíněný" \

    
