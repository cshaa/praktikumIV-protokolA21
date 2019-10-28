set terminal epslatex color
set output 'protokol-gnuplottex-fig1.tex'

        set xlabel "$\\varphi$ [\°]"
        set ylabel "N"
        load 'lines.cfg'
        set macros
        set key left top

        nd(A, x0, sigma, x) = A * exp(-(x-x0)**2/2./sigma**2)


        colselector(phi) = \
            '( $1 > 180 ? $1 - 360 : $1 ):($3 == '.phi.' ? $2 : 1/0)'

        set1 = colselector(0)
        set2 = colselector(30)
        set3 = colselector(60)
        set4 = colselector(90)

        A1 = A2 = A3 = A4 = 400
        mean1 = mean2 = mean3 = mean4 = 1
        sigma1 = sigma2 = sigma3 = sigma4 = 5


        f1(x) = nd(A1, mean1, sigma1, x)
        f2(x) = nd(A2, mean2, sigma2, x)
        f3(x) = nd(A3, mean3, sigma3, x)
        f4(x) = nd(A4, mean4, sigma4, x)


        fit f1(x) 'data1' using @set1 via A1, mean1, sigma1
        fit f2(x) 'data1' using @set2 via A2, mean2, sigma2
        fit f3(x) 'data1' using @set3 via A3, mean3, sigma3
        fit f4(x) 'data1' using @set4 via A4, mean4, sigma4


        set print "fits1.csv.tmp"
        print "psival, phival, phierr"
        print sprintf( "0, %.2f, %.2f", mean1, mean1_err)
        print sprintf("30, %.2f, %.2f", mean2, mean2_err)
        print sprintf("60, %.2f, %.2f", mean3, mean3_err)
        print sprintf("90, %.2f, %.2f", mean4, mean4_err)


        plot \
            'data1' using @set1 notitle lc palette cb 0, \
            f1(x) notitle lc palette cb 0, \
            NaN w lp title "$\\psi$ = 0°" lc palette cb 0, \
            \
            'data1' using @set2 notitle lc palette cb 2, \
            f2(x) notitle lc palette cb 2, \
            NaN w lp title "$\\psi$ = 30°" lc palette cb 2, \
            \
            'data1' using @set3 notitle lc palette cb 3, \
            f3(x) notitle lc palette cb 3, \
            NaN w lp title "$\\psi$ = 60°" lc palette cb 3, \
            \
            'data1' using @set4 notitle lc palette cb 4, \
            f4(x) notitle lc palette cb 4, \
            NaN w lp title "$\\psi$ = 90°" lc palette cb 4

    
