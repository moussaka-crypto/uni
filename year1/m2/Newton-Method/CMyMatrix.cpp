#include "CMyMatrix.h"
using std::wcerr;
using std::cout;
using std::endl;

CMyMatrix CMyMatrix::invers()
{
    CMyMatrix m = this->matrix;

    if (!(this->getZ() == 2 && this->getS() == 2)) {
        wcerr << "Inverse Matrix kann nicht berechnet werden (nur 2x2 Matrix m�glich)" << endl; exit(0);
    }
    else {
        double m_length = this->matrix[0][0] * this->matrix[1][1] - this->matrix[0][1] * this->matrix[1][0];//det

        double det_const = pow(m_length, -1); // 1/|A|

        double tmp_m00 = m[0][0];
        m[0][0] = m[1][1];
        m[1][1] = tmp_m00;
        m[0][1] *= -1; m[1][0] *= -1; //2x2 Werte nach Formel setzen

        for (int i = 0; i < this->getS(); i++) {

            CMyVektor S_vector = m[i];

            m[i] = (det_const * S_vector).getVector();
        }
        return m;
    }
}

CMyVektor CMyMatrix::operator*(CMyVektor x)
{
    if (!(this->getS() == x.GetDimension())) {

        wcerr << "Matrix-Vektor Multiplikation nicht m�glich (Dimensionen stimmen nicht)" << endl; exit(0);
    }
    else {
        CMyVektor Ax{ this->getZ() };

        for (int zeile = 0; zeile < this->getZ(); zeile++) {

            for (int spalte = 0; spalte < this->getS(); spalte++) {

                Ax.setComp(zeile, Ax[zeile] + (this->matrix[spalte][zeile] * x[spalte])); //Handbewegung simuliert
            }
        }
        return Ax;
    }
}

//std::ostream& operator<<(std::ostream& os, CMyMatrix m) {
//    os << "(";
//    int ende_xd = m.getZ() - 1;
//    int ende_yd = m.getS() - 1;
//
//    for (int yd = 0; yd < m.getS(); yd++) {
//
//        for (int xd = 0; xd < m.getZ(); xd++) {
//
//            os << this->matrix[xd][yd];
//            if (xd != ende_xd)
//                cout << "; ";
//        }
//        if (yd != ende_yd)
//            cout << "\n\t\t";
//    }
//    return os;
//}

void CMyMatrix::print()
{
    cout << "(";
    int ende_xd = this->getZ() - 1;
    int ende_yd = this->getS() - 1;

    for (int yd = 0; yd < this->getS(); yd++) {

        for (int xd = 0; xd < this->getZ(); xd++) {

            cout << this->matrix[xd][yd];
            if (xd != ende_xd)
                cout << "; ";
        }
        if (yd != ende_yd)
            cout << "\n\t\t";
    }
    cout << ")" << endl;
}

CMyMatrix jacobi(CMyVektor x, CMyVektor(*func)(CMyVektor x))
{
    const double h = pow(10, -4);
    CMyVektor f_x = func(x);
    CMyVektor Vx = x;

    int y_dim = f_x.GetDimension();
    int x_dim = x.GetDimension();

    CMyMatrix jacobiM{ x_dim,y_dim };

    for (int dy = 0; dy < x_dim; dy++) { // Zeilen = Funktionen in x

        Vx.setComp(dy, Vx[dy] + h);

        jacobiM[dy] = ((1 / h) * (func(Vx) - f_x)).getVector(); //Differenzenquotient im Mehrdim. A1 P2 Test
        Vx.setComp(dy, x[dy]);
    }
    return jacobiM;
}

void newtonverfahren(CMyVektor x, CMyVektor(*func)(CMyVektor x))
{
    CMyMatrix jacobiM = jacobi(x, func);
    CMyMatrix jacobi_inv = jacobiM.invers();

    CMyVektor dx = -1 * (jacobi_inv * func(x)); //nach Formel
    CMyVektor Vx = x;

    double fx_length = func(x).length(); int step;

    for (step = 0; fx_length >= pow(10, -5) && step < 50; step++) {

        cout << "Schritt " << step << ":" << endl;

        cout << "\tx = "; Vx.print();
        cout << "\tf(x) = "; func(Vx).print();

        jacobiM = jacobi(Vx, func);
        jacobi_inv = jacobiM.invers();

        dx = -1 * (jacobi_inv * func(Vx));
        Vx = Vx + dx; //!!! Newtonverfahren Schritt

        cout << "\tf'(x) = "; jacobiM.print();
        cout << "\t(f'(x))^(-1) = "; jacobi_inv.print();
        cout << "\tdx = "; dx.print(); //delta X 
        cout << "\t||f(x)|| = " << fx_length << endl << endl;

        fx_length = func(Vx).length();
    }

    if (step == 50)
        cout << "Ende wegen maximale Schrittanzahl (50) erreicht bei" << endl;
    else
        cout << "Ende wegen ||f(x)||<1e-5 bei" << endl;

    cout << "\tx = "; Vx.print();
    cout << "\tf(x) = "; func(Vx).print();
    cout << "\t||f(x)|| = " << fx_length << endl;
}
