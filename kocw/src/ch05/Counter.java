package ch05;

public class Counter {
	private int count = 0;
	
	public void addCount() {
		count ++;
	}
	public void init() {
		count = 0;
	}
	public int getCount() {
		return count;
	}
}
