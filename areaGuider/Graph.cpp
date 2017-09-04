/*
* The implement of the graph with adjacency list
*
* author berryhuang
* version 0.0.1 
* since 2017.08.29
* github https://github.com/BerryHuang99
*/

#include<iostream>
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

int Edge::getWeight() {
    return weight;
}

int Edge::getDest() {
    return dest;
}

Edge* Edge::getNext() {
    return next;
}

Head::Head(Type type){
    this->type = type
}

Head::~Head() {
    delete firstEdge;
}

void Head::setHead(Type type) {
    this->type = type;
}

void Head::setNext(Edge* next){
    firstEdge = next;
}

Type Head::getHead() {
    return type;
}

Edge* Head::getNext() {
    return firstEdge;
}


