using System;

namespace FP_Demo
{
    class Program
    {
        static float Fib_f(float n)
        {
            return (n < float.Epsilon) ? 0 : Fib_f(n - 1) + n;
        }

        static double Fib_d(double n)
        {
            return (n < double.Epsilon) ? 0 : Fib_d(n - 1) + n;
        }

        static void Main(string[] args)
        {
            double result_f1, result_d1, result_f2, result_d2;

            Console.WriteLine("Floating Point Demo");
            Console.WriteLine();
            Console.WriteLine("Float ==================================================================");
            float a_f = 1f;
            float b_f = 1e37f;
            float c_f = -1e37f;

            Console.WriteLine("a           = " + a_f.ToString());
            Console.WriteLine("b           = " + b_f.ToString());
            Console.WriteLine("c           = " + c_f.ToString());
            Console.WriteLine();

            Console.WriteLine("(a + b)     = " + (a_f + b_f).ToString());
            Console.WriteLine("(b + c)     = " + (b_f + c_f).ToString());
            Console.WriteLine();

            result_f1 = (a_f + b_f) + c_f;
            Console.WriteLine("(a + b) + c = " + result_f1.ToString());
            result_f2 = a_f + (b_f + c_f);
            Console.WriteLine("a + (b + c) = " + result_f2.ToString());
            Console.ReadKey();

            Console.WriteLine();
            Console.WriteLine("Double =================================================================");
            double a_d = 1d;
            double b_d = 1e37d;
            double c_d = -1e37d;

            Console.WriteLine("a           = " + a_d.ToString());
            Console.WriteLine("b           = " + b_d.ToString());
            Console.WriteLine("c           = " + c_d.ToString());
            Console.WriteLine();

            Console.WriteLine("(a + b)     = " + (a_d + b_d).ToString());
            Console.WriteLine("(b + c)     = " + (b_d + c_d).ToString());
            Console.WriteLine();

            result_d1 = (a_d + b_d) + c_d;
            result_d2 = a_d + (b_d + c_d);
            Console.WriteLine("(a + b) + c = " + result_d1.ToString());
            Console.WriteLine("a + (b + c) = " + result_d2.ToString());
            Console.ReadKey();

            Console.WriteLine();
            Console.WriteLine("========================================================================");
            Console.WriteLine("Delta f/d   = " + Math.Abs(result_d1 - result_f1).ToString());
            Console.WriteLine("Delta f/d   = " + Math.Abs(result_d2 - result_f2).ToString());
            Console.ReadKey();
            Console.Clear();



            Console.WriteLine("Float ==================================================================");
            float x_f = 9.99999968E37f;
            float y_f = 1.00001001E0f;
            float z_f = 9.99989986E-1f;
            Console.WriteLine("x           = " + x_f.ToString());
            Console.WriteLine("y           = " + y_f.ToString());
            Console.WriteLine("z           = " + z_f.ToString());
            Console.WriteLine();

            result_f1 = (x_f * y_f) - (x_f * z_f);
            Console.WriteLine("xy - xz     = " + result_f1.ToString());
            result_f2 = x_f * (y_f - z_f);
            Console.WriteLine("x(y - z)    = " + result_f2.ToString());
            Console.WriteLine("Delta       = " + Math.Abs(result_f1 - result_f2).ToString());
            Console.ReadKey();

            Console.WriteLine();
            Console.WriteLine("Double =================================================================");
            double x_d = 9.99999968E37d;
            double y_d = 1.00001001E0d;
            double z_d = 9.99989986E-1;
            Console.WriteLine("x           = " + x_d.ToString());
            Console.WriteLine("y           = " + y_d.ToString());
            Console.WriteLine("z           = " + z_d.ToString());
            Console.WriteLine();

            result_d1 = (x_d * y_d) - (x_d * z_d);
            Console.WriteLine("xy - xz     = " + result_d1.ToString());
            result_d2 = x_d * (y_d - z_d);
            Console.WriteLine("x(y - z)    = " + result_d2.ToString());
            Console.WriteLine("Delta       = " + Math.Abs(result_d1 - result_d2).ToString());
            Console.ReadKey();

            Console.WriteLine();
            Console.WriteLine("========================================================================");
            Console.WriteLine("Delta f/d   = " + Math.Abs(result_d1 - result_f1).ToString());
            Console.WriteLine("Delta f/d   = " + Math.Abs(result_d2 - result_f2).ToString());
            Console.ReadKey();
            Console.Clear();



            Console.WriteLine("Float ==================================================================");
            float n_f = 30000f;
            Console.WriteLine("n           = " + n_f.ToString());
            result_f1 = Fib_f(n_f);
            Console.WriteLine("fib_f(n)    = " + result_f1.ToString());
            Console.ReadKey();

            Console.WriteLine();
            Console.WriteLine("Double =================================================================");
            double n_d = 30000d;
            Console.WriteLine("n           = " + n_d.ToString());
            result_d1 = Fib_d(n_d);
            Console.WriteLine("fib_d(n)    = " + result_d1.ToString());
            Console.ReadKey();

            Console.WriteLine();
            Console.WriteLine("========================================================================");
            Console.WriteLine("Delta f/d   = " + Math.Abs(result_d1 - result_f1).ToString());

            Console.ReadKey();
            Environment.Exit(0);
        }
    }
}
