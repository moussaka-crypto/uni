#include <assert.h>
#include "DijkstraSP.h"

/**
 * Füge eine Kante mit minimalen Kosten hinzu, die von einem
 * Baumknoten zu einem Nicht-Baumknoten verläuft und deren
 * Ziel w dem Startknoten s am nächsten ist.
 *
 * \param[in]  G		Kantengewichteter-Digraph
 * \param[in]  v		Zielknoten
 */
void DijkstraSP::relax(EdgeWeightedDigraph G, int v)
{
	std::vector<DirectedEdge> edges = G[v];
	for (DirectedEdge e : edges)
	{
		int w = e.to();
		if (distToVect[w] > distToVect[v] + e.weight())
		{
			distToVect[w] = distToVect[v] + e.weight();
			edgeTo[w] = e;

			if (pq.contains(w))
				pq.change(w, distToVect[w]);
			else
				pq.push(w, distToVect[w]);
		}
	}
}

/**
 * Fuert den Dijkstra Algorithmus von s, im Graph G aus.
 *
 * \param[in]  G		Kantengewichteter-Digraph
 * \param[in]  s		Startknoten
 */
DijkstraSP::DijkstraSP(EdgeWeightedDigraph G, int s)
{
	distToVect.resize(G.getV());
	for (int v = 0; v < G.getV(); v++)
		distToVect[v] = DBL_MAX;

	distToVect[s] = 0;
	pq.push(s, 0);

	while (!pq.empty())
	{
		int min_node = pq.top().value;
		pq.pop();
		relax(G, min_node);
	}
}

/**
 * Gibt den Pfad von s nach v als Vektor zurueck
 *
 * \param[in]  v		Zielknoten
 * \return Vektor mit allen Kanten des Pfades von s nach v
 */
std::vector<DirectedEdge> DijkstraSP::pathTo(int v)
{
	std::vector<DirectedEdge> path;
	int ziel_node = v, path_size = 0;

	while (distToVect[ziel_node] > 0)
	{
		path.push_back(edgeTo[ziel_node]);
		ziel_node = edgeTo[ziel_node].from();
	}
	path_size = path.size();
	for (int i = 0; i < path_size / 2; i++)
	{
		/*DirectedEdge tmp = path[i];
		path[i] = path[path_size - i - 1];
		path[path_size - i - 1] = tmp;*/ //virgin

		std::swap(path[i], path[path_size - i - 1]); // chad
	}
	return path;
}

