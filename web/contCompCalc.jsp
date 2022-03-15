<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*,java.util.*"%>
<%@page import="java.lang.Math"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
    <%
        try{
            double p = 0.0;
            double apr = 0.0;
            double y = 0.0;
            double e = 2.71828;
            double calcOne = 0.0;        
            double calcTwo = 0.0;
            double calcThree = 0.0;
            double payment = 0.0;
            // HTML variable submitted by the user
            String princVal = request.getParameter("p");        
            String annualVal = request.getParameter("apr");
            String loanTermVal = request.getParameter("y");
            //Set the variables for calculations
            p = Double.valueOf(princVal);
            apr = Double.valueOf(annualVal);
            y = Double.valueOf(loanTermVal);
            // Calculations
            calcOne = apr * y;
            calcTwo = (Math.pow(e, calcOne));
            calcThree = p * calcTwo;
            payment = calcThree;
            // Results sent back to the HTML page for display
            response.sendRedirect("contComp.jsp?firstVar="+payment);
        }
        catch(Exception e){
            response.sendRedirect("error.html");
        }
    %>
    </body>
</html>