#include "KruskalMST.h"

/**
 * Erstellt einen MST zum Graph G mit dem Kruskal Algorithmus
 *
 * \param[in]  G		Kantengewichteter-Graph
 */
KruskalMST::KruskalMST(EdgeWeightedGraph G)
{
	this->treeID.assign(G.getV(), -1);
	std::priority_queue<Edge, std::vector<Edge>, std::greater<Edge>> pq;
	std::vector<Edge> e = G.edges();

	for (int i = 0; i < e.size(); i++)
		pq.push(e[i]);
	for (int i = 0; i < G.getV(); i++)
		treeID[i] = i;

	while (!pq.empty())
	{
		Edge e = pq.top();
		pq.pop();

		int v = e.either(),
			w = e.other(v);

		if (treeID[v] != treeID[w]) // prevent loop in graph
		{
			mst.push_back(e);
			int wID = treeID[w];
			for (int i = 0; i < G.getV(); i++)
				if (treeID[i] == wID)
					treeID[i] = treeID[v];
		}
	}
}

/**
 * Gibt die Summe aller Gewichte im MST zurueck
 *
 * \return Summe der Gewichte im MST
 */
double KruskalMST::weight() const
{
	double sum = 0;
	for (int i = 0; i < mst.size(); i++)
		sum += mst[i].weight();

	return sum;
}
