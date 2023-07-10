//#define CATCH_CONFIG_RUNNER
//#include "catch.h"
#include <iostream>
#include "EdgeWeightedGraph.h"
#include "PrimMST.h"
#include "Graphsearch.h"
#include "KruskalMST.h"
#include "DijkstraSP.h"

using namespace std;

struct node { // MST results
	int v;
	double weight;
};

void clearInput() {
	cin.clear();
	cin.ignore(numeric_limits<streamsize>::max(), '\n');
}

int main() {

	int input = 0;
	EdgeWeightedDigraph wDiGraph(0);
	EdgeWeightedGraph wGraph(0);

	while (true) {
		system("CLS");
		//------------------------------------------------------------------------
		// 1. Men� f�r Benutzereingaben
		//------------------------------------------------------------------------
		cout << "Praktikum 5: Graphenalgorithmen\n\n";
		cout<< "1) Test Cases\n\n"
			<< "2) Graph einlesen\n\n"
			<< "3) Tiefensuche\n"
			<< "4) Breitensuche\n\n"
			<< "5) MST nach Prim\n"
			<< "6) MST nach Kruskal\n\n"
			<< "7) Kuerzerste Wege nach Dijkstra\n\n"
			<< "8) Ausgabe der Adjazenzliste\n"
			<< "9) Kante loeschen\n\n"
			<< "11) Programm beenden\n\n"
			<< "?> ";

		try {
			cin >> input;
			if (input < 1 || input > 11)
				throw input;
		}
		catch (...)
		{
			cout << "Ungueltige Eingabe!\n";
			clearInput();
		}

		if (input == 1)
			// Starte Unit-Tests
			//Catch::Session().run(); system("PAUSE");

		// Graph Einlesen
		if (input == 2) {
			int g;
			cout << "\nPick a graph(1, 2 or 3)\n?> ";
			cin >> g;
			if (g == 1) {
				wDiGraph = EdgeWeightedDigraph("graph1.txt");
				wGraph = EdgeWeightedGraph("graph1.txt");
			}
			else if (g == 2) {
				wDiGraph = EdgeWeightedDigraph("graph2.txt");
				wGraph = EdgeWeightedGraph("graph2.txt");
			}
			else if (g == 3) {
				wDiGraph = EdgeWeightedDigraph("graph3.txt");
				wGraph = EdgeWeightedGraph("graph3.txt");
			}
			else
				continue;
		}

		//------------------------------------------------------------------------
		// 2. Ausgabe eines Graphen als Adjazenzliste implementieren
		//------------------------------------------------------------------------
		if (input == 8) {
			for (int i = 0; i < wGraph.getV(); i++) {

				cout << endl << i;
				for (Edge e : wGraph[i]) {
					cout << " -> " << e.other(i) << " [" << e.weight() << "]";
				}
			}
			cout << '\n';
			system("PAUSE");
		}

		//------------------------------------------------------------------------
		// 3. Suche in Graphen
		//------------------------------------------------------------------------
		if (input == 3) {
			int s = 0;
			cout << "\nTiefensuche (DFS)\n";
			vector<bool> marked;
			vector<int> edgeTo;
			cout << "Reihenfolge:\n" << s;
			bool connected = Graphsearch::DFS(wGraph, s, marked, edgeTo);

			cout << "\n\nEdgeTo Array:\n";
			for (int i = 0; i < edgeTo.size(); i++) {
				cout << i << " -> " << edgeTo[i];
				if (i == s) 
					cout << " (Start)";
				cout << '\n';
			}
			cout << "\nMarked Array:\n";
			for (int i = 0; i < marked.size(); i++) {
				cout << i << " -> ";
				if (marked[i]) 
					cout << "true";
				else 
					cout << "false";
				if (i == s) 
					cout << " (Start)";
				cout << '\n';
			}
			cout << "\nGraph ist ";
			if (!connected) 
				cout << "nicht ";
			cout << "zusammenhaengend\n\n";
			system("PAUSE");
		}
		if (input == 4) {
			int s = 0;
			cout << "\nBreitensuche (BFS) - Start: "; cin >> s;
			vector<bool> marked;
			vector<int> edgeTo;
			cout << "Reihenfolge:\n" << s;
			bool connected = Graphsearch::BFS(wGraph, s, marked, edgeTo);

			cout << "\n\nEdgeTo Array:\n";
			for (int i = 0; i < edgeTo.size(); i++) {
				cout << i << " -> " << edgeTo[i];
				if (i == s) 
					cout << " (Start)";
				cout << '\n';
			}
			cout << "\nMarked Array:\n";
			for (int i = 0; i < marked.size(); i++) {
				cout << i << " -> ";
				if (marked[i]) 
					cout << "true";
				else 
					cout << "false";
				if (i == s) 
					cout << " (Start)";
				cout << '\n';
			}
			cout << "\nGraph ist ";
			if (!connected) 
				cout << "nicht ";
			cout << "zusammenhaengend\n\n";
			system("PAUSE");
		}

		//------------------------------------------------------------------------
		// 4. MST mit Prim und Kruskal
		//------------------------------------------------------------------------
		if (input == 5) {
			int s = 0;
			cout << "\nStart: "; cin >> s;
			cout << "\nMST nach Prim:\n";
			PrimMST prim(wGraph, s);
			cout << "Gewicht: " << prim.weight() << '\n';
			cout << "Adjazenliste:\n";

			vector<vector<node>> r;
			r.resize(wGraph.getV());

			for (Edge edge : prim.edges()) {
				int u = edge.either(), v = edge.other(u);
				node p;
				p.v = v; 
				p.weight = edge.weight();
				r[u].push_back(p);
			}
			for (int i = 0; i < r.size(); i++) {
				if (r[i].empty())
					continue;

				cout << i;
				for (int j = 0; j < r[i].size(); j++) {
					cout << " -> " << r[i][j].v << " [" << r[i][j].weight << "]";
				}
				cout << '\n';
			}
			cout << '\n';
			system("PAUSE");
		}
		if (input == 6) {
			cout << "\nMST nach Kruskal: \n";
			KruskalMST kruskal(wGraph);
			cout << "Gewicht: " << kruskal.weight() << '\n';
			cout << "Adjazenliste:\n";

			vector<vector<node>> r;
			r.resize(wGraph.getV());

			for (Edge edge : kruskal.edges()) {
				int u = edge.either(), v = edge.other(u);
				node k;
				k.v = v; k.weight = edge.weight();
				r[u].push_back(k);
			}
			for (int i = 0; i < r.size(); i++) {
				if (r[i].empty())
					continue;
				cout << i;
				for (int j = 0; j < r[i].size(); j++) {
					cout << " -> " << r[i][j].v << " [" << r[i][j].weight << "]";
				}
				cout << '\n';
			}
			cout << '\n';
			system("PAUSE");
		}

		//------------------------------------------------------------------------
		// 5. Kuerzeste Wege mit Dijkstra
		//------------------------------------------------------------------------
		if (input == 7) {
			int s = 0;
			int z = 6;
			cout << "Start ?> "; cin >> s;
			cout << "Ziel ?> "; cin >> z;

			DijkstraSP dijkstra(wDiGraph, s);
			vector<DirectedEdge> path = dijkstra.pathTo(z);

			cout << "\nGewichtete Kanten des Graphen: ";
			for (int i = 0; i < wDiGraph.getV(); i++) {

				cout << '\n' << i;
				for (DirectedEdge e : wDiGraph[i]) {
					cout << " -> " << e.to() << " [" << e.weight() << "]";
				}
			}

			cout << "5\nKuerzerster Weg (Dijkstra):\n";
			cout << "Start:  " << s << '\n';
			cout << "Ziel:   " << z << '\n';

			cout << "Pfad:   " << s;
			for (DirectedEdge p : path) {
				cout << " -> " << p.to() << " [" << p.weight() << "]";
			}
			cout << "\nKosten: " << dijkstra.distTo(z) << "\n\n";
			system("PAUSE");
		}
		if (input == 9)
		{
			int u = 0, v = 0; double w = 0;
			cout << "\nChoose an edge to delete: \n" << "1. Vertex ?> "; cin >> u;
			cout << "\n2. Vertex ?> "; cin >> v;
			cout << "\nWeight ?>"; cin >> w;
			Edge e{u,v,w};
			wGraph.del_Edge(e);	
		}
		if (input == 11)
			break;
	}
	return 0;
}