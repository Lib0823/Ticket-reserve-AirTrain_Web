<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Insert title here</title>
<style>
table {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;

}
tr {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
}
th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}
 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
</style>
</head>

<body>
<select  id = "start" name = "_airstartlist"  onchange="location.href=this.value">
<option>출발지 선택</option>
<option value = "INAirBu.jsp">부산</option>
<option value = "INAirJe.jsp">제주</option>
<option value = "INAirKi.jsp">김포</option>
</select>

<%
	String astart = request.getParameter("astart");
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/test_b","root","1234");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from air where aid Like 'IN%'and astart like '제%'");
		out.println("<table border=1");
		out.println("<tr><th>항공편명</th><th>항공사명</th><th>날짜</th><th>시간</th><th>출발지</th><th>도착지</th></tr>");
		while(rs.next()){
			String aid = rs.getString("aid");
			String aname = rs.getString("aname");
			Date adate = rs.getDate("adate");
			String atime = rs.getString("atime");
			astart = rs.getString("astart");
			String aend = rs.getString("aend");
			out.println("<tr>");
			out.println("<td>"+aid+"</a></td>");
			out.println("<td>"+aname+"</td>");
			out.println("<td>"+adate+"</td>");
			out.println("<td>"+atime+"</td>");
			out.println("<td>"+astart+"</td>");
			out.println("<td>"+aend+"</td>");
			out.println("</tr>");
		}
		out.println("</table>");
		rs.close();
		stmt.close();
		conn.close();
	}catch(SQLException e){
		e.printStackTrace();
	}
%>

</body>
</html>