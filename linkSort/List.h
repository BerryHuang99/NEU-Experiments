// @auther Berry Huang
// @since 2017.04.23

#ifndef _LIST_H_
#define _LIST_H_
#include <iostream>
using namespace std;

	template <class T> 
	class List;

	// The node of the link
	template <class T>
	class Node
	{
		friend class List<T>;
	public:
		Node() { link = NULL; }
		// Constructor

		~Node() {}
		// Disructor

		T getValue() const
		{
			return value;
		}
		// Retrieve value of this node

		void set(T value)
		{
			this->value = value;
		}
		// Modify the value of this node;

	private:
		T value;
		Node<T> *link;
	};

	// The link about nodes 
	template <class T>
	class List
	{
	public:
		List();
		~List();

		int length();
		// Retrieve the length of the list

		void add(T value);
		// add new node in the end of the list

		Node<T> *getMin();
		// Retrieve the node which has the minimum 

		void reverse_1();
		// Reverse the link with recursion

		void reverse_2();
		//  Reverse the link with unrecursion

		void printList();
		// Print the whoel values of the list orderly.

	private:
		Node<T> *p;
		Node<T> *head;
		Node<T> *last;
	};
	
	
template <class T>
List<T>::List()
{
	head = new Node<T>()  ;
	last = head;
	p = NULL;
}

template <class T>
List<T>::~List()
{
	p = head;
	Node<T> *q = NULL;
	while (p != NULL) 
	{
		q = p;
		p = p->link;
		delete(q);
	}
}

template <class T>
int List<T>::length()
{
	int l = 0;
	for (p = head; p != last; p = p->link)
	{
		l++;
	}
	p = NULL;
	return l;
}

template <class T>
void List<T>::add(T value)
{
	last->value = value;
	last->link = new Node<T>();
	last = last->link;
}

template <class T>
Node<T> *List<T>::getMin()
{
	if (length() != 0)
	{
		Node<T> *min = head;
		for (p = head; p != last; p = p->link)
		{
			if (p->value < min->value) {
				min = p;
			}
		}
		p = NULL;
		return min;
	}
	else return NULL;
}

template <class T>
void List<T>::reverse_1()
{
	Node<T> *q = NULL;
	Node<T> *r = NULL;
	
	if (p == NULL)
	{
		p = head;
	}
	else
	{
		p = p->link;
	}
	
	if (p->link != last)
	{
		q = p;
		reverse_1();
		r = q->link;
		r->link = q;
		
		if (q == head)
		{
			q->link = new Node<T>();
			last = q->link;
			head = p;
			p = NULL;
		} 
	}
	else{
		delete(last);
	}
}

template <class T>
void List<T>::reverse_2()
{
	Node<T> *next = NULL;
	Node<T> *pre = NULL;
	pre = head;
	p = head->link;
	next = p->link; 

	while(next != NULL)
	{
		p->link = pre;
		pre = p;
		p = next;
		next = next->link;
	}

	delete(last);
	head->link = new Node<T>();
	last = head->link;
	head = pre;
	p = NULL;
}

template <class T>
void List<T>::printList()
{
	if (length() != 0)
	{
		for (p = head; p->link != NULL; p = p->link) {
			cout << p->getValue() << endl;
		}
		p = NULL;
	}
}
#endif // !_LIST_H_
