/*
* The implement of the graph with adjacency list
*
* author berryhuang
* version 0.0.1 
* since 2017.08.29
* github https://github.com/BerryHuang99
*/

#include<iostream>
#include<fstream>
#include<string>
#include "Graph.h"
using namespace std;

Edge::Edge(int dest, int weight) {
    this->dest = dest;
    this->weight = weight;
}

Edge::~Edge() {
    delete next;
}

void Edge::setWeight(int weight) {
    this->weight = weight;
}

void Edge::setDest(int dest) {
    this->dest = dest;
}

void Edge::setNext(Edge* next) {
    this->next = next;
}

int Edge::getWeight() const {
    return weight;
}

int Edge::getDest() const {
    return dest;
}

Edge* Edge::getNext() const {
    return next;
}

template<class Type>
Head<Type>::Head(Type type) {
    this->type = type;
}

template<class Type>
Head<Type>::~Head() {
    delete firstEdge;
}

template<class Type>
void Head<Type>::setHead(Type type) {
    this->type = type;
}

template<class Type>
void Head<Type>::setNext(Edge* next){
    firstEdge = next;
}

template<class Type>
Type Head<Type>::getHead() const {
    return type;
}

template<class Type>
Edge* Head<Type>::getNext() const {
    return firstEdge;
}

template<class Type>
Graph<Type>::Graph(string fileName) {
    ifstream fin;
    string str;

    fin.open(fileName, ios::in);
//    locale china("zh_CN.UTF-8");
    if (!fin.is_open()) {
        cout << "The file isn't exit." << endl;
        return;
    }

    while(getline(fin,str)) {
        cout << str << endl;
    }
}

template<class Type>
Graph<Type>::~Graph() {
 //   delete[] heads;
}

template<class Type>
void Graph<Type>::add(Type name, Type nextName, int weight) {
    int i = 0;
    bool flag = false;
    Head<Type> head;

    if (heads.empty()) {
        heads.push_back(new Head<Type>(name));
    } else {
        for (t = heads.begin(); t != heads.end(); t++) {
            if (*t.getHead() == name) {
                flag = true;
                head = *t;
                break;
            }
        }
        if (!flag) {
            head = new Head<Type>(name);
            heads.push_back(head);
        }

        flag = false;
        for (t = heads.begin(); t != heads.end(); t++) {
            i++;
            if (*t.getHead() == nextName) {
                flag = true;
                break;
            }
        } 
        if (!flag) {
            i++;
            heads.push_back(new Head<Type>(name));
        }

        Edge* edge = new Edge(i, weight);
        Edge* p;
        for (p = head->getNext(); p->getNext() = NULL; p = p->getNext());
        p->setNext(edge);
    }
}

int main() {
    Graph<string>* g = new Graph<string>("route.graph");
    int a;
    cin >> a;
}
