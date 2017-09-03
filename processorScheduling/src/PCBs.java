import java.util.ArrayList;

/**
 * The class <code>PCBs</code> is the processor scheduling. 
 * 
 * @author BerryHuang
 * @version 1.0.0 
 * @since 2017.6.22
 * @see PCB
 */
public class PCBs {

	private PCB head = null;
	private int cpuTime = 0;
	ArrayList<PCB> pcbs = new ArrayList<PCB>();
	
	PCBs() {
		head = new PCB("head", 0, 1000);
	}
	
	public void add(PCB pcb) {
		
		PCB p = head;
		
		while (p.getNext() != null) {
			if (p.getNext().getPriority() < pcb.getPriority()) {
				break;
			}
			p = p.getNext();
		}
		
		p.setNext(pcb);
	}
	
	public void add2(PCB pcb) {

		pcbs.add(pcb);
	}
	
	public void run() {
		PCB p = head;
		PCB r = null;
		
		while (head.getNext() != null) {
			p = head.getNext();
			this.cpuTime++;
			r = p;
			for (r = r.next; r != null; r = r.next) {
				if (r.isRun()) {
					r.setCPUTime(r.getCPUTime() + 1);
				}
			}
			p.working();
			print();
			if (p.check()) {
				finish();
			} else {
				refresh();
			}
		}
		
		System.out.println("NAME\tRoundTime\tWatingTime");
		for (PCB pcb : pcbs) {
			System.out.println(pcb.getName() + "\t" + pcb.getRoundTime() + "\t\t" + (pcb.getRoundTime() - pcb.getFor_needTime()));
		}
	}
	
	private void print() {
		System.out.println("CPUTIME: " + this.cpuTime);
		for (PCB p : this.pcbs) {
			System.out.println(p.toString());
		}
		System.out.println();
	}
	
	private void refresh() {
		PCB p = head.getNext();
		PCB r = head.getNext().getNext();
		p.next = null;
		
		head.next = r;
		add(p);
	}
	
	private void finish() {
		head.next.setRoundTime(cpuTime);
		PCB p = head.getNext().getNext();
		head.next = p;
	}
}
