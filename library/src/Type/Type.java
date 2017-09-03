package Type;

public abstract class Type {
	private String name;
	private long id = 0;
	
	public Type(String name, long id) {
		this.name = name;
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public long getId() {
		return id;
	}
	
	public boolean equal(Type t) {
		if (name.equals(t.getName()) && id == t.getId())
			return true;
		return false;
	}
}
