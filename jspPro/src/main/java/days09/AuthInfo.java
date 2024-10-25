package days09;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
//인증 정보를 저장할 클래스
public class AuthInfo {
	
	private String id;
	private String name;
	private ArrayList<String> authority; // 권한

}
