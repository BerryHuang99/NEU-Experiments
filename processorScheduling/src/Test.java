
/**
 * The class <code>Test</code> models the PCB. 
 * 
 * @author BerryHuang
 * @version 1.0.0 
 * @since 2017.6.22
 * @see PCB
 * @see PCBs
 */
public class Test {

	public static void main(String[] args) {
		PCBs pcbs = new PCBs();
		PCB p1 = new PCB("P1", 2, 1);
		PCB p2 = new PCB("P2", 3, 5);
		PCB p3 = new PCB("P3", 1, 3);
		PCB p4 = new PCB("P4", 2, 4);
		PCB p5 = new PCB("P5", 4, 2);

		pcbs.add(p1);
		pcbs.add(p2);
		pcbs.add(p3);
		pcbs.add(p4);
		pcbs.add(p5);
		
		pcbs.add2(p1);
		pcbs.add2(p2);
		pcbs.add2(p3);
		pcbs.add2(p4);
		pcbs.add2(p5);
		
		pcbs.run();
	}

}
