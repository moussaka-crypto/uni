using System;
using System.Collections.Generic;
using System.Windows;

namespace ChristmasTask
{
    internal class Route : ICloneable, IComparable<Route>
    {
        public List<Vector> Homes = new List<Vector>();

        public double Distance
        {
            get
            {
                double ret = 0;
                for (int i = 0; i < Homes.Count - 2; i++)
                {
                    ret += Math.Sqrt(Math.Pow(Homes[i].X - Homes[i + 1].X, 2)
                                    + Math.Pow(Homes[i].Y - Homes[i + 1].Y, 2));
                }
                return ret;
            }
        }

        public int Count => Homes.Count;

        public object Clone()
        {
            Route clone = new Route();
            clone.Homes.AddRange(Homes.ToArray());
            return clone;
        }

        public int CompareTo(Route other)
        {
            return Distance.CompareTo(other.Distance);
        }
    }
}