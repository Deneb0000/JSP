package days06;

import java.io.Serializable;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;

//자바빈 규약을 따르는 자바빈을 선언 할꺼다!
@Getter
@Setter
public class MemberInfo implements Serializable{
	
/**
	 * 
	 */
	private static final long serialVersionUID = 9123949164526925578L;
//직렬화가 가능하다
private	String id     ;
private	String name   ;
private	String passwd ;
private	String email  ;
private Date registerDate;

}
