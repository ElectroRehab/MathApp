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
        // What kind of Calculation Required?
        String what = request.getParameter("whatCalc");
        // Calculations for Absolute and Revlative Difference
        if(what.equals("abRel")){
            try{
                double comValDouble = 0.0;
                double refValDouble = 0.0;
                //Get parameters from login form
                String comVal = request.getParameter("comVal");    
                String refVal = request.getParameter("refVal");
                comValDouble = Double.valueOf(comVal);
                refValDouble = Double.valueOf(refVal);
                // Calculations
                double absoDiff = comValDouble-refValDouble;
                double relDiff = (((comValDouble-refValDouble)/refValDouble)*1.00);
                double relDiffPer = relDiff * 100;
                response.sendRedirect("index.jsp?firstVar="+absoDiff+"&secondVar="+relDiff+"&thirdVar="+relDiffPer+"&fourthVar="+comVal+"&fifthVar="+refVal);
            }
            catch(Exception e){
                response.sendRedirect("error.html");
            }

        }
        
        //Calcuations for Loan Payment Formula
        if(what.equals("loanCalc")){
            try{
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
                //Calculations
                if (apr >= 1){
                    apr = apr / 100;
                }
                calcOne = principal * (apr / n);
                calcTwo = 1 + (apr / n);
                calcThree = (-n*y);
                calcFour = (1 - (Math.pow(calcTwo, calcThree)));
                payment = calcOne / calcFour;
                totalPayments = ((y) * (n) * (payment));
                // Results sent back to the HTML page for display
                response.sendRedirect("loan.jsp?firstVar="+payment+"&secondVar="+totalPayments+"&thirdVar="+princVal+"&fourthVar="+apr+"&fifthVar="+paymentsVal+"&sixthVar="+loanTermVal);
            }
            catch(Exception e){
                response.sendRedirect("error.html");
            }
        }
        // Calcuations for Savings Plan Formula
        if(what.equals("savingsCalc")){
            try{
                double a = 0.0;
                double apr = 0.0;
                double n = 0.0;
                double y = 0.0;
                double calcOne = 0.0;        
                double calcTwo = 0.0;
                double calcThree = 0.0;
                double calcFour = 0.0;
                double payment = 0.0;
                // HTML variable submitted by the user
                String princVal = request.getParameter("a");        
                String annualVal = request.getParameter("apr");
                String paymentsVal = request.getParameter("n");
                String loanTermVal = request.getParameter("y");
                //Set the variables for calculations
                a = Double.valueOf(princVal);
                apr = Double.valueOf(annualVal);
                n = Double.valueOf(paymentsVal);
                y = Double.valueOf(loanTermVal);
                // Calculations
                if (apr >= 1){
                    apr = apr / 100;
                }
                calcOne = a * (apr/n);
                calcTwo = 1 + (apr/n);
                calcThree = n*y;
                calcFour = ((Math.pow(calcTwo, calcThree))-1);        
                payment = calcOne / calcFour;
                // Results sent back to the HTML page for display
                response.sendRedirect("savings.jsp?firstVar="+payment+"&secondVar="+princVal+"&thirdVar="+apr+"&fourthVar="+paymentsVal+"&fifthVar="+loanTermVal);
            }
            catch(Exception e){
                response.sendRedirect("error.html");
            }
        }        
        // Calcuations for Compund Interest Formula
        if(what.equals("compoundCalc")){
            try{
                double p = 0.0;
                double apr = 0.0;
                double y = 0.0;
                double calcOne = 0.0;        
                double calcTwo = 0.0;
                double calcThree = 0.0;
                double payment = 0.0;
                // HTML variable submitted by the user
                String princVal = request.getParameter("p");        
                String annualVal = request.getParameter("apr");
                String termVal = request.getParameter("y");
                //Set the variables for calculations
                p = Double.valueOf(princVal);
                apr = Double.valueOf(annualVal);
                y = Double.valueOf(termVal);
                // Calculations
                if (apr >= 1){
                    apr = apr / 100;
                }
                calcOne = 1 + (apr);
                calcTwo = (Math.pow(calcOne, y));
                calcThree = p * calcTwo;
                payment = calcThree;
                // Results sent back to the HTML page for display
                response.sendRedirect("compound.jsp?firstVar="+payment+"&secondVar="+princVal+"&thirdVar="+apr+"&fourthVar="+termVal);
            }
            catch(Exception e){
                response.sendRedirect("error.html");
            }
        }
        
        // Calcuations for Compund Interest Multiple Times Formula
        if(what.equals("multiCalc")){
            try{
                double p = 0.0;
                double apr = 0.0;
                double n = 0.0;
                double y = 0.0;
                double calcOne = 0.0;        
                double calcTwo = 0.0;
                double calcThree = 0.0;
                double calcFour = 0.0;
                double payment = 0.0;
                // HTML variable submitted by the user
                String princVal = request.getParameter("p");        
                String annualVal = request.getParameter("apr");
                String paymentsVal = request.getParameter("n");
                String loanTermVal = request.getParameter("y");
                //Set the variables for calculations
                p = Double.valueOf(princVal);
                apr = Double.valueOf(annualVal);
                n = Double.valueOf(paymentsVal);
                y = Double.valueOf(loanTermVal);
                // Calculations
                if (apr >= 1){
                    apr = apr / 100;
                }
                calcOne = 1 + (apr/n);
                calcTwo = n*y;
                calcThree = (Math.pow(calcOne, calcTwo));
                calcFour = p * calcThree;
                payment = calcFour;
                // Results sent back to the HTML page for display
                response.sendRedirect("compMulti.jsp?firstVar="+payment+"&secondVar="+princVal+"&thirdVar="+apr+"&fourthVar="+paymentsVal+"&fifthVar="+loanTermVal);
            }
            catch(Exception e){
                response.sendRedirect("error.html");
            }
        }
        // Calcuations for Continuos Compund Interest Multiple Times Formula
        if(what.equals("contCompCalc")){
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
                if (apr >= 1){
                    apr = apr / 100;
                }
                calcOne = apr * y;
                calcTwo = (Math.pow(e, calcOne));
                calcThree = p * calcTwo;
                payment = calcThree;
                // Results sent back to the HTML page for display
                response.sendRedirect("contComp.jsp?firstVar="+payment+"&secondVar="+princVal+"&thirdVar="+apr+"&fourthVar="+loanTermVal);
            }
            catch(Exception e){
                response.sendRedirect("error.html");
            }
        }        
    %>
    </body>
</html>
