using System;
using System.Diagnostics;
using System.Threading;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Threading;

namespace CacheLoops
{
    /// <summary>
    /// Interaktionslogik für MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private readonly DispatcherTimer GuiTimer;

        private double progCreate = 0;
        private double progSumUpBad = 0;
        private double progSumUpLinear = 0;

        private int j, k, i;
        private long sum = 0;

        private readonly Stopwatch stCreate = new Stopwatch();
        private readonly Stopwatch stSumUpBad = new Stopwatch();
        private readonly Stopwatch stSumUpLinear = new Stopwatch();

        private const int W = 1000;
        private const int H = 1000;
        private const int Y = 1000;
        private const long size = (long)W * H * Y;
        private readonly int[,,] a = new int[W, H, Y];

        public MainWindow()
        {
            InitializeComponent();

            GuiTimer = new DispatcherTimer { Interval = TimeSpan.FromMilliseconds(40) };
            GuiTimer.Tick += GuiTimer_Tick;
            GuiTimer.Start();
        }

        private void GuiTimer_Tick(object sender, EventArgs e)
        {
            LblPbCreate.Content = Math.Round(PbCreate.Value = progCreate / size * 100) + " %";
            LblPbSumUpBad.Content = Math.Round(PbSumUpBad.Value = progSumUpBad / size * 100) + " %";
            LblPbSumUpLinear.Content = Math.Round(PbSumUpLinear.Value = progSumUpLinear / size * 100) + " %";

            PrintStatus(LblCreate, stCreate);
            PrintStatus(LblSumUpBad, stSumUpBad);
            PrintStatus(LblSumUpLinear, stSumUpLinear);

            SbValI.Content = "i = " + i;
            SbValJ.Content = "j = " + j;
            SbValK.Content = "k = " + k;
            SbValSum.Content = "sum = " + sum;
        }

        private void PrintStatus(Label lbl, Stopwatch st)
        {
            lbl.Content = (st.ElapsedMilliseconds == 0 ? "" :
                (st.IsRunning ? "Running" : "Finished")) + "\n" +
                st.Elapsed.ToString("mm\\:ss\\.fff");
        }

        private void BtnCreate_Click(object sender, RoutedEventArgs e)
        {
            new Thread(Create).Start();
        }

        private void BtnSumUpBad_Click(object sender, RoutedEventArgs e)
        {
            new Thread(SumUpBad).Start();
        }

        private void BtnSumUpLinear_Click(object sender, RoutedEventArgs e)
        {
            new Thread(SumUpLinear).Start();
        }

        private void Create()
        {
            stCreate.Reset();
            stCreate.Start();
            progCreate = 0;
            Random rnd = new Random();

            for (i = 0; i < W; i++)
            {
                for (j = 0; j < H; j++)
                {
                    for (k = 0; k < Y; k++)
                    {
                        a[i, j, k] = rnd.Next();
                        progCreate++;
                    }
                }
            }
            stCreate.Stop();
        }

        private void SumUpBad()
        {
            GC.Collect();

            stSumUpBad.Reset();
            stSumUpBad.Start();
            progSumUpBad = 0;
            sum = 0;

            for (k = 0; k < Y; k++)
            {
                for (j = 0; j < H; j++)
                {
                    for (i = 0; i < W; i++)
                    {
                        sum += a[i, j, k];
                        progSumUpBad++;
                    }
                }
            }

            stSumUpBad.Stop();
        }

        private void SumUpLinear()
        {
            GC.Collect();

            stSumUpLinear.Reset();
            stSumUpLinear.Start();
            progSumUpLinear = 0;
            sum = 0;

            for (i = 0; i < W; i++)
            {
                for (j = 0; j < H; j++)
                {
                    for (k = 0; k < Y; k++)
                    {
                        sum += a[i, j, k];
                        progSumUpLinear++;
                    }
                }
            }

            stSumUpLinear.Stop();
        }
    }
}
