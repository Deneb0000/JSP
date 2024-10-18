package org.doit.domain;

//import java.time.LocalDateTime;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder

public class EmpVO {
	private int empno;
	private String ename, job;
	private int mgr;
	private Date hiredate;
	private double sal; //pay
	private double comm;
	private int deptno;
//	private LocalDateTime hiredate;


} //class
