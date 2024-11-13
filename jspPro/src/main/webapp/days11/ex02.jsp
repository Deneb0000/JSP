<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
 span.material-symbols-outlined{
    vertical-align: text-bottom;
 }  
</style>
</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">KenIk HOme</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code">
       ex02.jsp   
   *** 3. 로직 이해...*** 
   [DB]
   글번호 제목           작성자 ... 
   1      첫번째게시글   홍길동(새글)
   2      두번째게시글   서영학(새글)
   3      세번째게시글   정창기(새글)
   4      2-1 답글     정창기(답글)
   5      2-1-1 답글     홍길동(답글)
   6      네번째게시글   정창기(새글)
   7      6-1 답글       홍길동(답글)
   
   [화면출력]  order by 글번호 desc
   글번호 제목           작성자 ...  
   6      네번째게시글   정창기(새글)
   7      6-1 답글       홍길동(답글)
   3      세번째게시글   정창기(새글) 
   2      두번째게시글   서영학(새글) 
   4      2-1 답글     정창기(답글)
   5      2-1-1 답글     홍길동(답글)
   1      첫번째게시글   홍길동(새글)    
   
   ----------------------------------------------
   [알고리즘]
   1) 컬럼 3개 추가 처리
   [DB]
   글번호 제목           작성자 ...    글그룹(REF)  그룹순서(STEP)   깊이(DEPTH)
   1      첫번째게시글   홍길동(새글)       1           1              0
   2      두번째게시글   서영학(새글)       2           1              0
   3      세번째게시글   정창기(새글)       3           1              0
   4      2-1 답글     정창기(답글)       2           5              1 
   5      2-2 답글     이시훈(답글)       2           3              1
   6      2-3 답글     김준석(답글)       2           2              1  
   7      3-1 답글     김재민(답글)       3           2              1 
   8      2-2-1답글    원충희(답글)       2           4              2 
   
   [화면출력]  order by 글그룹 desc, 그룹순서 asc  
   글번호 제목           작성자 ...  
   3      세번째게시글   정창기(새글)       3           1              0
   7      ㄴ 3-1 답글     김재민(답글)     3           2              1
   2      두번째게시글   서영학(새글)       2           1              0
   6      2-3 답글     김준석(답글)       2           2              1 
   5       ㄴ2-2 답글     이시훈(답글)     2         3              1 
   8         ㄴ2-2-1답글    원충희(답글)       2           4              2
   4       ㄴ2-1 답글     정창기(답글)     2          5              1
   1      첫번째게시글   홍길동(새글)       1           1              0
  
  ----------------------------------------------
   2) 컬럼 2개 추가 처리    
   [DB]                              rs
   글번호 제목           작성자 ...    1개컬럼   깊이(DEPTH)
   1                                1000       0
   2                                2000       0
   3                                1998       1
   4                                 999       1
   5                                1999       1
     
   
   
   [화면출력]  order by rs desc
   글번호 제목           작성자 ...  
   2                                2000       0
    ㄴ 5                              1999       1
    ㄴ                                1998       1
   1                                1000       0
    ㄴ4                                 999       1
              
              
  </xmp>
</div> 
</body>
</html>







 

