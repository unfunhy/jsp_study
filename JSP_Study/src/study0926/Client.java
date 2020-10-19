package study0926;

public class Client {
	private String username;
	private int age;
	private String sex;
	private String phone;
	private String addr;
	private String mail;
	
	public Client() {
		this.username= "null";
		this.age= 0;
		this.sex= "null";
		this.phone= "null";
		this.addr= "null";
		this.mail= "null";
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
}
