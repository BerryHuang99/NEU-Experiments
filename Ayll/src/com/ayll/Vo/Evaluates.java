package com.ayll.Vo;

import java.util.ArrayList;
import java.util.Iterator;

public class Evaluates {
	
private ArrayList<Evaluate> evaluates = null;
	
	public Evaluates() {
		evaluates = new ArrayList<Evaluate>();
	}
	
	public void add(Evaluate evaluate) {
		this.evaluates.add(evaluate);
	}

	public boolean hasNext() {
		// TODO Auto-generated method stub
		return false;
	}

	public Evaluate next() {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<Evaluate> getEvaluates() {
		return evaluates;
	}

	public void setEvaluates(ArrayList<Evaluate> evaluates) {
		this.evaluates = evaluates;
	}
	
	public Iterator<Evaluate> iterator() {
		return evaluates.iterator();
	}
}
