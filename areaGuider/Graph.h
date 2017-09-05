/*
* The definition of the graph with adjacency list
*
* author berryhuang
* version 0.0.1 
* since 2017.08.29
* github https://github.com/BerryHuang99
*/

#ifndef GRAPH_H
#define GRAPH_H
#include<string>
using namespace std;

// the edge of the graph
class Edge {

    private:
        int weight;
        int dest;
        Edge* next;

    public:
        Edge(int dest, int weight);
        ~Edge();
        void setWeight(int weight);
        void setDest(int dest);
        void setNext(Edge* next);
        int getWeight();
        int getDest();
        Edge* getNext();

};

// the head node of the adjacency list
template<class Type>
class Head {

    private:
        Type type;
        Edge* firstEdge;
    
    public:
        Head(Type type);
        ~Head();
        void setHead(Type type);
        void setNext(Edge* next);
        Type getHead();
        Edge* getNext();

};

// the graph with adjacency list
template<class Type>
class Graph {

    private:
        Head* heads;

    public:
        Graph(string fileName);
        ~Graph();
        void add(Type name, Type nextName, int weight);
        void remove();
};

#endif
