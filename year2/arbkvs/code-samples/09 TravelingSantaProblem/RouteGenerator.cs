using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Windows;

namespace ChristmasTask
{
    /// <summary>
    /// Examples see: https://stemlounge.com/animated-algorithms-for-the-traveling-salesman-problem/
    /// 
    /// </summary>
    internal static class RouteGenerator
    {
        /// <summary>
        /// Generator function for routes
        /// </summary>
        /// <param name="route">Current route</param>
        /// <param name="unvisited">Unvisited homes</param>
        internal delegate void RouteGeneratorFct(ref Route route, List<Vector> unvisited);

        /// <summary>
        /// Randomly adds all unvisited homes to the route
        /// </summary>
        /// <param name="route">Route of visited homes</param>
        /// <param name="unvisited">List of unvisited homes</param>
        public static void FindRandomRoute(ref Route route, List<Vector> unvisited)
        {
            // Random number generator
            Random random = new Random();

            // Pick random stops
            while (unvisited.Count > 0)
            {
                Vector home = unvisited[random.Next(0, unvisited.Count - 1)];
                route.Homes.Add(home);
                unvisited.Remove(home);
            }

            // Return home
            route.Homes.Add(route.Homes[0]);
        }

        /// <summary>
        /// Tries all possible routes and picks the optimal (master solution)
        /// </summary>
        /// <param name="route">Route of visited homes</param>
        /// <param name="unvisited">List of unvisited homes</param>
        public static void FindOptimalRoute(ref Route route, List<Vector> unvisited)
        {
            if (unvisited.Count == 0) { return; }
            Route[] routes = new Route[unvisited.Count];
            Thread[] threads = new Thread[unvisited.Count];

            // Create new route as a clone and add each potential next destination
            for (int i = 0; i < unvisited.Count; i++)
            {
                List<Vector> unvisitedClone;
                routes[i] = (Route)route.Clone();
                unvisitedClone = new List<Vector>(unvisited.ToArray());

                // Add next stop and remove that from the list of unvisited homes
                routes[i].Homes.Add(unvisited[i]);
                unvisitedClone.Remove(unvisited[i]);

                // Create threads for a given max. nesting depth
                if (route.Count < 2)
                {
                    // We must store i in a temporary variable, otherwise the thread might use a wrong index on start since i might have changed then
                    int idx = i;
                    // Find best route recursively
                    threads[i] = new Thread(() => { FindOptimalRoute(ref routes[idx], unvisitedClone); });
                    threads[i].Start();
                }
                else { FindOptimalRoute(ref routes[i], unvisitedClone); }
            }

            // Do some stuff AFTER the recursive calls did their work
            for (int i = 0; i < unvisited.Count; i++)
            {
                // Wait for all threads to finish
                if (threads[i] != null) { threads[i].Join(); }

                // If the route is complete, return home
                // (1, because we have not removed the lastly added stop yet)
                if (unvisited.Count == 1) { routes[i].Homes.Add(route.Homes[0]); }
            }

            // Select shortest route
            route = routes.Min();
        }
    }
}