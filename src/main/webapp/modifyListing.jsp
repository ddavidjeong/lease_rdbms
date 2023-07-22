<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="object.*" %>
<% List<listingBean> listings = (List<listingBean>)session.getAttribute("listingOption"); %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String choice = request.getParameter("listing");%>
<% int num = Integer.parseInt(choice);%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modify/Update listings</title>
</head>
<body>
<h2>Modify/Update exist listings</h2>
    <%
      String start = request.getParameter("start");
      String end = request.getParameter("end");
      String numPeople = request.getParameter("num");
      String user = "root";
      String password = "pass";
      
      userBean userInfo = (userBean)session.getAttribute("userInfo");
      int listingID = 0;
      
      for(listingBean listing: listings) {
    		 if (listing.getOption() == num){
    			 listingID = listing.getListingID();
    		     break;
    		 	}
    		 }
    	
      try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/lease?autoReconnect=true&useSSL=false";
        
        try (Connection con = DriverManager.getConnection(url, user, password)) {
          String modifySql = "UPDATE listings SET start_date = ?, "
        		  + "end_date = ?, max_headcount = ? where listing_id = ?";
          PreparedStatement stmt = con.prepareStatement(modifySql, Statement.RETURN_GENERATED_KEYS);
          
          
          stmt.setString(1, start);
          stmt.setString(2, end);
          stmt.setString(3, numPeople);
          stmt.setInt(4, listingID);
          
          int rowsAffected = stmt.executeUpdate();
          request.setAttribute("affect", rowsAffected);
        }
		} catch (SQLException e) {
  			out.println("SQLException caught: " + e.getMessage());
		} catch (ClassNotFoundException e) {
  			out.println("ClassNotFoundException caught: " + e.getMessage());
		}
	%>
	<c:choose>
		<c:when test="${affect > 0}">
		<h2>Successfully created new listing</h2>
		<p>Create new listing or add new property
			<a href="landlordPage.jsp"><button>back</button> </a>
		</p>
		<p>Go back to choosing role page
			<a href="tenant_or_landlord.jsp"><button>back</button> </a>
		</p>
		</c:when>
	<c:otherwise>
		<h2>Error during process</h2>
		Back to choosing listing page
		<a href="chooseListing.jsp"><button>back</button></a>
	</c:otherwise>
</c:choose>
</body>
</html>