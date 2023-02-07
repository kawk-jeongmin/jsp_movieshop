<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="cart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="product.Product"%>
<%@ page import="product.ProductDAO"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1" >  <!-- 반응형 웹에 사용하는 메타태그 -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css"> <!-- 참조  -->
 <title>해리포터</title>

    

    <!-- Bootstrap core CSS -->
<link href="/docs/5.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.0/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.0/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.0/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />

    </head>
    <body>
        <jsp:include page="/menu.jsp" flush="false"/>
<main>   
<%
Connection conn = null;
ResultSet rs = null;
Statement stmt = null;

String dbURL = "jdbc:mysql://localhost:3306/SHOP?serverTimezone=UTC";
String dbID = "root";
String dbPassword = "Kjm0408^^";
Class.forName("com.mysql.cj.jdbc.Driver");

try{
	String SQL = "SELECT * FROM product WHERE company = '해리포터'";
	conn = DriverManager.getConnection(dbURL, dbID, dbPassword);    
	stmt = conn.createStatement();
	 
	rs = stmt.executeQuery(SQL);
%>

<%
ArrayList <Product> productList = new ArrayList<>();
while(rs.next()){ 
	Product pro = new Product();
	pro.setNo(rs.getString("no"));
	pro.setName(rs.getString("name"));
	pro.setPrice(rs.getString("price"));
	pro.setCompany(rs.getString("company"));
	productList.add(pro);
}%>
<div class="album py-5 bg-light">
<div class="container">

  <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
<% for(int i=0; i<productList.size(); i++){
%>

		<div class="col">
          <div class="card shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

            <div class="card-body">
              <p class="card-text"><%= productList.get(i).getName() %></p>
              <p class="card-text"><%= productList.get(i).getPrice() +"원" %></p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                <form method="post">
                <select name="count">
                        <% for(int j=1; j<=10; j++){ %>
                        <option value="<%=j%>"><%=j %>개</option>
                        <%} %> 
                        </select>&nbsp;&nbsp;
                  <button type="button" class="btn btn-sm btn-outline-secondary"
                  onclick="location.href='purchase.jsp?proNo=<%=productList.get(i).getNo()%>&proCompany=<%=productList.get(i).getCompany()%>'">구매하기</button>
                  </form>
                  <button type="button" class="btn btn-sm btn-outline-secondary"
                  onclick="location.href='cart.jsp?proNo=<%=productList.get(i).getNo()%>&proCompany=<%=productList.get(i).getCompany()%>'">장바구니 담기</button>
                </div>
                <!-- <small class="text-muted">9 mins</small> -->
              </div>
            </div>
          </div>
        </div>
        <%
}
rs.close();
stmt.close();
conn.close();

}catch(SQLException e){
	out.println("err"+e.toString());
}
%>
        </div>
        </div>
        </div>
        </main>
        
<footer class="text-muted py-5">
  <div class="container">
    <p class="float-end mb-1">
      <a href="#">Back to top</a>
    </p>
    <p class="mb-1">Album example is &copy; Bootstrap, but please download and customize it for yourself!</p>
    <p class="mb-0">New to Bootstrap? <a href="/">Visit the homepage</a> or read our <a href="/docs/5.0/getting-started/introduction/">getting started guide</a>.</p>
  </div>
</footer>

     <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
      
</body>
</html>