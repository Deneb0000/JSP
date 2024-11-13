package auth.service;

public class User {

	private String id;
	private String name;
	// 권한
	// 정보

	public User(String id, String name) {
		this.id = id;
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}

}
