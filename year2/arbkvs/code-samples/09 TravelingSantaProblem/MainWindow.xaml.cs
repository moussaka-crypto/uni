using MaterialDesignThemes.Wpf;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Globalization;
using System.Linq;
using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using System.Windows.Threading;
using static ChristmasTask.RouteGenerator;

namespace ChristmasTask
{
    /// <summary>
    /// Interaktionslogik für MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        // Vector with coordinates of the homes to visit
        private Vector[] homes;

        // UI elements representing given homes
        private Viewbox[] homeUiControls;

        // Random number generator
        private readonly Random random = new Random();

        public MainWindow()
        {
            InitializeComponent();
            snowTimer.Tick += (s, arg) => Snow();
        }

        #region "Snowflakes"
        private readonly DispatcherTimer snowTimer = new DispatcherTimer { Interval = TimeSpan.FromMilliseconds(150) };

        private void Snow()
        {
            int x = random.Next(0, (int)GridSnow.ActualWidth);
            int y = -100;
            double s = random.Next(10, 25) * (0.0001 * GridSnow.ActualWidth);
            int rotateAmount = random.Next(0, 270);

            RotateTransform rotateTransform = new RotateTransform(rotateAmount);
            ScaleTransform scaleTransform = new ScaleTransform(s, s);
            TranslateTransform translateTransform = new TranslateTransform(x, y);

            PackIcon flake = new PackIcon
            {
                Kind = PackIconKind.Snowflake,
                Foreground = Brushes.White,
                IsHitTestVisible = false,
                RenderTransform = new TransformGroup
                {
                    Children = new TransformCollection { rotateTransform, scaleTransform, translateTransform }
                }
            };
            GridSnow.Children.Add(flake);

            Duration duration = new Duration(TimeSpan.FromSeconds(random.Next(5, 9)));

            x += random.Next(-50, 50);
            DoubleAnimation xAnimation = GenerateAnimation(x, duration, flake, "RenderTransform.Children[2].X");

            y += (int)GridSnow.ActualHeight + 110;
            DoubleAnimation yAnimation = GenerateAnimation(y, duration, flake, "RenderTransform.Children[2].Y");

            rotateAmount += random.Next(90, 360);
            DoubleAnimation rotateAnimation = GenerateAnimation(rotateAmount, duration, flake, "RenderTransform.Children[0].Angle");

            Storyboard story = new Storyboard();
            story.Completed += (sender, e) => GridSnow.Children.Remove(flake);
            story.Children.Add(xAnimation);
            story.Children.Add(yAnimation);
            story.Children.Add(rotateAnimation);
            story.Duration = new Duration(TimeSpan.FromSeconds(20));    // Remove snow after some time, but not immediately!
            flake.Loaded += (sender, args) => story.Begin();
        }

        private static DoubleAnimation GenerateAnimation(int x, Duration duration, PackIcon flake, string propertyPath)
        {
            DoubleAnimation animation = new DoubleAnimation
            {
                To = x,
                Duration = duration
            };
            Storyboard.SetTarget(animation, flake);
            Storyboard.SetTargetProperty(animation, new PropertyPath(propertyPath));

            return animation;
        }
        #endregion

        #region "User Input"
        /// <summary>
        /// Validates user input to be numerical
        /// </summary>
        private void NumberValidationTextBox(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        /// <summary>
        /// Generates a new grid with homes
        /// </summary>
        private void BtnGenerate_Click(object sender, RoutedEventArgs e)
        {
            snowTimer.Stop();
            GridTrees.Children.Clear();
            GridTrees.ColumnDefinitions.Clear();
            GridTrees.RowDefinitions.Clear();
            GridLines.Children.Clear();
            LblRandom.Content = "";
            LblOptimal.Content = "";

            // Read user inputs
            if (!int.TryParse(TxtCols.Text, out int W) ||
                !int.TryParse(TxtRows.Text, out int H) ||
                !int.TryParse(TxtHomes.Text, out int homeCount))
            {
                MessageBox.Show("Faulty inputs");
                return;
            }

            if (homeCount > W * H)
            {
                MessageBox.Show("Cannot have more homes than space");
                return;
            }

            Random r = new Random();
            homes = new Vector[homeCount];

            // Generate random homes on our matrix
            for (int i = 0; i < homeCount; i++)
            {
                Vector home;
                int x, y;
                do
                {
                    x = r.Next(0, W);
                    y = r.Next(0, H);
                    home = new Vector(x, y);
                }
                while (homes.Contains(home));
                homes[i] = home;
            }

            // Create rows and columns
            for (int x = 0; x < W; x++)
            {
                GridTrees.ColumnDefinitions.Add(new ColumnDefinition() { Width = new GridLength(1, GridUnitType.Star) });
            }
            for (int y = 0; y < H; y++)
            {
                GridTrees.RowDefinitions.Add(new RowDefinition() { Height = new GridLength(1, GridUnitType.Star) });
            }

            // Add icons for each homes
            homeUiControls = new Viewbox[homeCount];
            PackIconKind kind = PackIconKind.Home;
            for (int i = 0; i < homeCount; i++)
            {
                PackIcon tree = new PackIcon() { Kind = kind, Foreground = Brushes.DarkGreen };
                Viewbox vb = new Viewbox() { Child = tree };
                Grid.SetColumn(vb, (int)homes[i].X);
                Grid.SetRow(vb, (int)homes[i].Y);
                GridTrees.Children.Add(vb);
                homeUiControls[i] = vb;

                // First icon should be Santa's home, others trees
                kind = PackIconKind.PineTree;
            }

            BtnRandomRoute.IsEnabled = BtnOptimalRoute.IsEnabled = true;
        }

        /// <summary>
        /// Finds a random route
        /// </summary>
        private void BtnRandomRoute_Click(object sender, RoutedEventArgs e)
        {
            FindRoute(FindRandomRoute);
        }

        /// <summary>
        /// Finds the optimal route
        /// </summary>
        private void BtnOptimalRoute_Click(object sender, RoutedEventArgs e)
        {
            FindRoute(FindOptimalRoute);
        }

        /// <summary>
        /// Calculates the faculty for a given number n.
        /// Be aware of calling this with large numbers...
        /// </summary>
        public long Faculty(long n)
        {
            return n == 0 ? 1 : n * Faculty(n - 1);
        }

        /// <summary>
        /// Shows the number of possible routes for the given number of homes to visit
        /// </summary>
        private void TxtHomes_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (!int.TryParse(((TextBox)sender).Text, out int homes)) { LblPermutations.Content = "0"; }

            LblPermutations.Content = Faculty(homes).ToString("N", 
                new NumberFormatInfo() { NumberDecimalDigits = 0, NumberGroupSeparator = "." });
        }
        #endregion

        /// <summary>
        /// Finds a route with a given generator function and prints the result
        /// </summary>
        /// <param name="generator">Route generator</param>
        private void FindRoute(RouteGeneratorFct generator)
        {
            if (homes == null) { return; }

            Stopwatch st = new Stopwatch();
            st.Start();

            Route route = new Route();
            List<Vector> unvisited = homes.ToList();

            // Start is fixed:
            Vector start = unvisited[0];
            route.Homes.Add(start);
            unvisited.Remove(start);

            // Find route
            generator(ref route, unvisited);
            st.Stop();

            // Print route
            Console.WriteLine("Route:");
            foreach (Vector v in route.Homes) { Console.WriteLine(v.X + ", " + v.Y); }
            Console.WriteLine("Distance: " + route.Distance);

            // Update labels
            string status = Math.Round(route.Distance, 2) + " km / " + st.ElapsedMilliseconds + " ms";
            if (generator == FindRandomRoute) { LblRandom.Content = status; }
            else { LblOptimal.Content = status; }

            // Draw route
            Polyline poly = new Polyline
            {
                Stroke = Brushes.Red,
                StrokeThickness = GridLines.ActualWidth * 0.004
            };

            foreach (Vector v in route.Homes)
            {
                int homeIdx = Array.IndexOf(homes, v);
                if (homeIdx < 0) { continue; }

                Viewbox vb = homeUiControls[homeIdx];

                poly.Points.Add(new Point(
                    VisualTreeHelper.GetOffset(vb).X + (vb.ActualWidth / 2),
                    VisualTreeHelper.GetOffset(vb).Y + (vb.ActualHeight / 2)));
                GridLines.Children.Clear();
                GridLines.Children.Add(poly);
            }

            // Let it snow
            snowTimer.Start();
        }
    }
}