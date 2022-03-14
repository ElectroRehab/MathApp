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
        double principal = 0.0;
        double apr = 0.0;
        double n = 0.0;
        double y = 0.0;
        double calcOne = 0.0;        
        double calcTwo = 0.0;
        double calcThree = 0.0;
        double calcFour = 0.0;
        double payment = 0.0;
        double totalPayments = 0.0;
        // HTML variable submitted by the user
        String princVal = request.getParameter("p");        
        String annualVal = request.getParameter("apr");
        String paymentsVal = request.getParameter("n");
        String loanTermVal = request.getParameter("y");
        //Set the variables for calculations
        principal = Double.valueOf(princVal);
        apr = Double.valueOf(annualVal);
        n = Double.valueOf(paymentsVal);
        y = Double.valueOf(loanTermVal);
        // Calculations
        calcOne = principal * (apr / n);
        calcTwo = 1 + (apr/n);
        calcThree = (-n*y);
        calcFour = (1 - (Math.pow(calcTwo, calcThree)));
        payment = calcOne / calcFour;
        totalPayments = ((y) * (n) * (payment));
        // Results sent back to the HTML page for display
        response.sendRedirect("loan.jsp?firstVar="+payment+"&secondVar="+totalPayments);
    %>
    </body>
</html>