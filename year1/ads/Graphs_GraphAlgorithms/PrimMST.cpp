#include "PrimMST.h"

/**
 * Erstellt einen MST zum Graph G mit dem Prim Algorithmus
 *
 * \param[in]  G		Kantengewichteter-Graph
 * \param[in]  s		Startknoten
 */
PrimMST::PrimMST(EdgeWeightedGraph G, int s)
{
	this->marked.assign(G.getV(), false);
	this->visit(G, s);

	while (!this->pq.empty())
	{
		Edge e = pq.top(); 
		pq.pop();
		int v = e.either(), w = e.other(v);

		if (this->marked[v] && this->marked[w]) 
			continue;

		mst.push_back(e);
		if (!this->marked[v]) visit(G, v);
		if (!this->marked[w]) visit(G, w);
	}
}

/**
 * Markiert Knoten v im Graph G als markiert und fuegt alle Nachbarn zur pq hinzu
 *
 * \param[in]  G		Kantengewichteter-Graph
 * \param[in]  v		Knoten im Graph G
 */
void PrimMST::visit(EdgeWeightedGraph G, int v)
{
	this->marked[v] = true;
	std::vector<Edge> edges = G[v];
	const size_t adj_cnt = edges.size();

	for (int i = 0; i < adj_cnt; i++)
		if (!this->marked[edges[i].other(v)]) //wenn Nachbarn unbesucht, dann in PQ rein
			pq.push(edges[i]);
}

/**
 * Gibt die Summe aller Gewichte im MST zurueck
 *
 * \return Summe der Gewichte im MST
 */
double PrimMST::weight() const
{
	double sum = 0;
	for (int i = 0; i < mst.size(); i++)
		sum += mst[i].weight();

	return sum;
}
