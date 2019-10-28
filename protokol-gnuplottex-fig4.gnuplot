set terminal epslatex color
set output 'protokol-gnuplottex-fig4.tex'

        set xlabel "x"
        set ylabel "y"

        xa(psi) = -cos(psi)
        ya(psi) = -sin(psi)

        xb(psi, phi) = cos(psi + phi)
        yb(psi, phi) = sin(psi + phi)

        ax(psi, phi) = yb(psi, phi) - ya(psi)
        ay(psi, phi) = xa(psi) - xb(psi, phi)

        b(psi, phi) = ax(psi, phi)*xa(psi) + ay(psi, phi)*ya(psi)

        det(psi1, phi1, psi2, phi2) = \
            ax(psi1, phi1)*ay(psi2, phi2) - ay(psi1, phi1)*ax(psi2, phi2)

        xint(psi1, phi1, psi2, phi2) = ( \
                b(psi1, phi1) * ay(psi2, phi2) - \
                b(psi2, phi2) * ay(psi1, phi1) \
            ) / det(psi1, phi1, psi2, phi2)

        yint(psi1, phi1, psi2, phi2) = ( \
                b(psi2, phi2) * ax(psi1, phi1) - \
                b(psi1, phi1) * ax(psi2, phi2) \
            ) / det(psi1, phi1, psi2, phi2)

    
