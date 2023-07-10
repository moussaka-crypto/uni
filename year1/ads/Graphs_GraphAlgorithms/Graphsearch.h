#pragma once
#include "EdgeWeightedDigraph.h"
#include "EdgeWeightedGraph.h"
#include <iostream>

namespace Graphsearch {

	/**
		* Fuehrt eine rekursive Tiefensuche im Graphen G,
		* ab dem Knoten v aus und markiert alle besuchten
		* Knoten in marked.
		* Alle besuchten Knoten werden ausgegeben.
		*
		* \param[in]	 G			Graph
		* \param[in]	 v			Startknoten
		* \param[in/out] marked		Bereits besuchte Knoten
		* \param[in/out] edgeTo		Vektor mit dem Nachfolgeknoten zu jedem Knoten
		*/
	void DFS_rec(const EdgeWeightedGraph& G, int v, std::vector<bool>& marked, std::vector<int>& edgeTo, 
		int count, std::vector<int>& id) {

		if (v != 0) 
			std::cout << " -> " << v;
		
		marked[v] = true;
		id[v] = count;

		for (Edge e : G.getAdj(v))
		{
			if (!marked[e.other(v)])
			{
				edgeTo[e.other(v)] = v;
				DFS_rec(G, e.other(v), marked, edgeTo, count, id);
			}
		}
	}

	/**
		* Fuehrt eine rekursive Tiefensuche im Graphen g, ab dem Knoten v aus.
		* Alle besuchten Knoten werden ausgegeben.
		* Starterfunktion zu DFS_recursive(EdgeWeigtedGraph, int, std::vector<bool>, std::vector<int>)
		*
		* \param[in]  G			Graph
		* \param[out] marked	Bereits besuchte Knoten
		* \param[out] edgeTo	Vektor mit dem Nachfolgeknoten zu jedem Knoten
		* \param[in]  v			Startknoten
		* \return	  true		Graph ist zusammenhaengend
		*			  false		Graph ist nicht zusammenhaengend
		*/

	bool DFS(const EdgeWeightedGraph& G, int v, std::vector<bool>& marked, std::vector<int>& edgeTo) {

		int cnt = 0;
		std::vector<int> id;
		id.resize(G.getV(), -1);
		edgeTo.assign(G.getV(), -1);
		marked.assign(G.getV(), false);

		DFS_rec(G, v, marked, edgeTo, cnt, id);

		for (int i = 0; i < id.size(); i++)
			if (id[i] != 0)
				return false;
		return true;
	}

	/**
		* Fuehrt eine iterative Breitensuche im Graphen g, ab dem Knoten v aus.
		* Alle besuchten Knoten werden ausgegeben.
		*
		* \param[in]  G			Graph
		* \param[in]  v			Startknoten
		* \param[out] marked	Gibt an welche Knoten besucht wurden bei der Suche
		* \param[out] edgeTo	Gibt den Nachfolgerknoten eines Knoten an
		* \return	  true		Graph ist zusammenhaengend
		*			  false		Graph ist nicht zusammenhaengend
		*/
	bool BFS(const EdgeWeightedGraph& G, int v, std::vector<bool>& marked, std::vector<int>& edgeTo) {

		std::queue<int> q;
		edgeTo.assign(G.getV(), -1);
		marked.assign(G.getV(), false);
		q.push(v);

		while (!q.empty())
		{
			int x = q.front();
			q.pop();

			if (marked[x])
				continue;
			if (x != v)
				std::cout << " -> " << x;

			marked[x] = true;
			for (Edge e : G[x])
			{
				if (!marked[e.other(x)])
				{
					if (edgeTo[e.other(x)] == -1)
						edgeTo[e.other(x)] = x;
					q.push(e.other(x));
				}
			}
		}

		for (int i = 0; i < G.getV(); i++)
			if (!marked[i])
				return false;

		return true;
	}
}
