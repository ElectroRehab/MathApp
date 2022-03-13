<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*,java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
    <%
        
        double comValDouble = 0.0;
        double refValDouble = 0.0;
        
        //Get parameters from login form
        String comVal = request.getParameter("comVal");    
        String refVal = request.getParameter("refVal");
        comValDouble = Double.valueOf(comVal);
        refValDouble = Double.valueOf(refVal);
        double absoDiff = comValDouble-refValDouble;
        double relDiff = (((comValDouble-refValDouble)/refValDouble)*1.00);
        double relDiffPer = relDiff * 100;
        response.sendRedirect("index.jsp?firstVar="+absoDiff+"&secondVar="+relDiff+"&thirdVar="+relDiffPer);
    %>
    </body>
</html>
