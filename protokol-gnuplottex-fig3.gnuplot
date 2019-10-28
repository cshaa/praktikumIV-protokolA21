set terminal epslatex color
set output 'protokol-gnuplottex-fig3.tex'

        set xlabel "$\\varphi$ [\°]"
        set ylabel "N"
        load 'lines.cfg'
        set macros
        set key left top

        arbitrarilyLargeNumber = 1000000000

        nd(A, x0, sigma, x) = A * exp(-(x-x0)**2/2./sigma**2)


        colselector(phi) = \
            '( $1 > 180 ? $1 - 360 : $1 ):($3 == '.phi.' ? $2 : 1/0)'

        set1 = colselector(0)
        set2 = colselector(60)
        set3 = colselector(90)

        A1a = A1b = A2a = A2b = A3a = A3b = 400
        mean1a = mean2a = mean3a = mean4a = -20
        mean1b = mean2b = mean3b = mean4b = 20
        sigma1a = sigma2a = sigma3a = sigma4a = 15
        sigma1b = sigma2b = sigma3b = sigma4b = 15
        noise1 = noise2 = noise3 = 1

        f1(x) = noise1 < 0 ? arbitrarilyLargeNumber : \
            nd(A1a, mean1a, sigma1a, x) + nd(A1b, mean1b, sigma1b, x) + noise1

        f2(x) = noise2 < 0 ? arbitrarilyLargeNumber : \
            nd(A2a, mean2a, sigma2a, x) + nd(A2b, mean2b, sigma2b, x) + noise2

        f3(x) = noise3 < 0 ? arbitrarilyLargeNumber : \
            nd(A3a, mean3a, sigma3a, x) + nd(A3b, mean3b, sigma3b, x) + noise3


        fit f1(x) 'data3' using @set1 \
        via A1a, mean1a, sigma1a, A1b, mean1b, sigma1b, noise1

        fit f2(x) 'data3' using @set2 \
        via A2a, mean2a, sigma2a, A2b, mean2b, sigma2b, noise2

        fit f3(x) 'data3' using @set3 \
        via A3a, mean3a, sigma3a, A3b, mean3b, sigma3b, noise3


        set print "fits3.csv.tmp"
        print "psival, phiA, phiAerr, phiB, phiBerr"
        fmt = "%d, %.2f, %.2f, %.2f, %.2f"
        print sprintf(fmt,  0, mean1a, mean1a_err, mean1b, mean1b_err)
        print sprintf(fmt, 60, mean2a, mean2a_err, mean2b, mean2b_err)
        print sprintf(fmt, 90, mean3a, mean3a_err, mean3b, mean3b_err)


        plot \
            'data3' using @set1 notitle lc palette cb 0, \
            f1(x) notitle lc palette cb 0, \
            NaN w lp title "$\\psi$ = 0°" lc palette cb 0, \
            \
            'data3' using @set2 notitle lc palette cb 2, \
            f2(x) notitle lc palette cb 2, \
            NaN w lp title "$\\psi$ = 60°" lc palette cb 2, \
            \
            'data3' using @set3 notitle lc palette cb 3, \
            f3(x) notitle lc palette cb 3, \
            NaN w lp title "$\\psi$ = 90°" lc palette cb 3

    
