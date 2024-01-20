package Q2Solution;

public class Employee {
	private int id;
	private String name,email,mobileNum;

	public Employee(int id, String name, String email, String mobileNum) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.mobileNum = mobileNum;
	}

	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name=name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobileNum() {
		return mobileNum;
	}

	public void setMobileNum(String mobileNum) {
		this.mobileNum = mobileNum;
	}

}
