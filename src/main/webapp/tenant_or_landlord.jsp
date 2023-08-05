<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Tenant or Landlord</title>
    <style>
      body {
        background-color: #f8bbd0; /* Set the background color to a light pink */
      }

      h1 {
        color: #007bff; /* Set the heading color to a blue shade */
      }

      form {
        margin-top: 20px;
      }

      /* Style the buttons */
      button {
        background-color: #4CAF50; /* Green background color for buttons */
        color: white; /* White text color for buttons */
        padding: 10px 20px;
        border: none;
        cursor: pointer;
        border-radius: 5px;
      }
      
      input[type="submit"] {
        background-color: #4CAF50; /* Green background color for buttons */
        color: white; /* White text color for buttons */
        padding: 10px 20px;
        border: none;
        cursor: pointer;
        border-radius: 5px;
      }

      /* Add some spacing between buttons */
      form:not(:last-child) {
        margin-bottom: 10px;
      }
    </style>
  </head>
  <body>
   <div style="text-align: center">
    <h1>Please choose the role you want: Tenant or Landlord</h1>
 
    <form action="search.jsp">
    If you are Tenant, Please click Tenant Button
      <input type="submit" value="Tenant">
    </form>
    
    <form action="landlordPage.jsp">
    If you are Landlord, please click Landlord Button
      <input type="submit" value="Landlord">
    </form>

	<form action="profile.jsp">
	you can check your profile here
		<input type="submit" value="profile page">
	</form>
    
    <p>Logout
    <a href="MainPage.jsp"><button>logout</button> </a>
    </p>
   </div>
  </body>
</html>

