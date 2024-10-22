package org.doit.domain;

import java.time.LocalDateTime;
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
	private String ename;
	private String job;
	private int mgr;
	// private LocalDateTime hiredate;
	private Date hiredate; // 맞출려고 util Date 로 바꿔줌
	private double sal; // pay
	private double comm;
	private int deptno;

} // class
