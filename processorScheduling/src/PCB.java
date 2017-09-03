
/**
 * The class <code>PCB</code> is the class modeling the programming. 
 * 
 * @author BerryHuang
 * @version 1.0.0 
 * @since 2017.6.22
 */
public class PCB {

	private String name = null;
	private int needTime = 0;
	private int priority = 0;
	private int CPUTime= 0;
	private String state = null;
	private boolean run = false;
	private int roundTime = 0;
	private int for_needTime = 0;
	protected PCB next = null;
	
	PCB(String name, int needTime, int priority) {
		this.setName(name);
		this.needTime = needTime;
		this.setFor_needTime(needTime);
		this.priority = priority;
		this.setState("ready");
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getNeedTime() {
		return needTime;
	}

	public void setNeedTime(int needTime) {
		this.needTime = needTime;
	}

	public int getPriority() {
		return priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public boolean isRun() {
		return run;
	}

	public void setRun(boolean run) {
		this.run = run;
	}

	public int getCPUTime() {
		return CPUTime;
	}

	public void setCPUTime(int cPUTime) {
		CPUTime = cPUTime;
	}

	public int getRoundTime() {
		return roundTime;
	}

	public void setRoundTime(int roundTime) {
		this.roundTime = roundTime;
	}

	public int getFor_needTime() {
		return for_needTime;
	}

	public void setFor_needTime(int for_needTime) {
		this.for_needTime = for_needTime;
	}

	public PCB getNext() {
		return next;
	}

	public void setNext(PCB pcb) {
		
		if (this.next == null){
			this.next = pcb;
		} else {
			pcb.next = this.next;
			this.next = pcb;
		}
	}
	
	
	public void working() {
		this.priority--;
		this.needTime--;
		this.CPUTime++;
		if (this.needTime == 0) {
			this.setState("finish");
			setRun(false);
		} else {
			this.setState("working");
			setRun(true);
		}
	}
	
	public boolean check() {
		if (this.needTime != 0) {
			this.setState("ready");
			return false;
		}
		
		return true;
	}
	
	public String toString() {
		return (this.name + "  " + this.CPUTime +"\t" + this.needTime + "\t" + this.priority + "\t" + this.state);
		
	}

}

