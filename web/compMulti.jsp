<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import ="java.time.LocalDateTime"%> 
<%@page import ="java.time.format.DateTimeFormatter"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Dashboard - Brand</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="assets/css/Contact-Form-Clean.css">
</head>

<body id="page-top">
    <%
        String first = request.getParameter("firstVar");
        String second = request.getParameter("secondVar");
        String third = request.getParameter("thirdVar");
        String fourth = request.getParameter("fourthVar");
        String fifth = request.getParameter("fifthVar");
    %>
    <div id="wrapper">
        <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0">
            <div class="container-fluid d-flex flex-column p-0"><a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
                    <div class="sidebar-brand-icon rotate-n-15"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icon-tabler-math">
                            <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                            <path d="M16 13l4 4m0 -4l-4 4"></path>
                            <path d="M20 5h-7l-4 14l-3 -6h-2"></path>
                        </svg></div>
                    <div class="sidebar-brand-text mx-3"><span>MATH HELPER</span></div>
                </a>
                <hr class="sidebar-divider my-0">
                <ul class="navbar-nav text-light" id="accordionSidebar">
                    <li class="nav-item"><a class="nav-link" href="index.jsp"><i class="fa fa-clock-o"></i><span>Relative Difference</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="loan.jsp"><i class="fa fa-home"></i><span>Loan Payment Formula</span></a><a class="nav-link" href="savings.jsp"><i class="fa fa-money"></i><span>Savings Plan Formula</span></a><a class="nav-link" href="compound.jsp"><i class="fa fa-money"></i><span>Compound Interest</span></a><a class="nav-link" href="compMulti.jsp"><i class="fa fa-money"></i><span>Compound Interest Multiple Times a Years&nbsp;</span></a><a class="nav-link" href="contComp.jsp"><i class="fa fa-money"></i><span>Continuous Compounding Interest</span></a></li>
                </ul>
                <div class="text-center d-none d-md-inline"><button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button></div>
            </div>
        </nav>
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                    <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle me-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars"></i></button></div>
                </nav>
                <div class="container-fluid">
                    <div class="d-sm-flex justify-content-between align-items-center mb-4">
                        <h3 class="text-dark mb-0">Compound Interest Multiple Times a Year</h3>
                    </div>
                    <div class="row">
                        <div class="col-lg-7 col-xl-8">
                            <div class="card shadow mb-4">
                                <div class="card-header d-flex justify-content-between align-items-center">
                                    <h6 class="text-primary fw-bold m-0">Compound Interest Multiple Times a Year</h6>
                                </div>
                                <section class="contact-clean">
                                    <form method="post" action="allCalc.jsp">
                                        <h2 class="text-center">CALCULATIONS</h2>
                                        <%if(fourth==null){%>
                                            <div class="mb-3"><input class="form-control" type="text" name="p" placeholder="Starting Principal (P)"></div>
                                            <div class="mb-3"><input class="form-control" type="text" name="apr" placeholder="Annual Percentage Rate (APR)"></div>
                                            <div class="mb-3"><input class="form-control" type="text" name="n" placeholder="Number of Payments Per Year (n)"></div>
                                            <div class="mb-3"><input class="form-control" type="text" name="y" placeholder="Number of Years (Y)"></div>
                                            <input type="hidden" name="whatCalc" value="multiCalc">
                                            <div class="mb-3"><button class="btn btn-primary" type="submit">send </button></div>
                                        <%}
                                        else{%>
                                            <div class="mb-3"><input class="form-control" type="text" name="p" placeholder="Starting Principal (P)=<%out.print(second);%>"></div>
                                            <div class="mb-3"><input class="form-control" type="text" name="apr" placeholder="Annual Percentage Rate (APR)=<%out.print(third);%>"></div>
                                            <div class="mb-3"><input class="form-control" type="text" name="n" placeholder="Number of Payments Per Year (n)=<%out.print(fourth);%>"></div>
                                            <div class="mb-3"><input class="form-control" type="text" name="y" placeholder="Number of Years (Y)=<%out.print(fifth);%>"></div>
                                            <input type="hidden" name="whatCalc" value="multiCalc">
                                            <div class="mb-3"><button class="btn btn-primary" type="submit">send </button></div>
                                        <%}%>
                                    </form>
                                </section>
                            </div>
                        </div>
                        <div class="col-lg-5 col-xl-4">
                            <div class="card shadow mb-4">
                                <div class="card-header d-flex justify-content-between align-items-center">
                                    <h6 class="text-primary fw-bold m-0">Answer</h6>
                                </div>
                                <div class="card-body"><label class="form-label">Answer($)<input type="text" name="absoDif" placeholder="$<%out.print(first);%>"></label></div><label class="form-label" style="font-size: 24px;"><img src="assets/img/dogs/CompMulti.JPG"><br></label>
                            </div>
                        </div>
                        <div class="col"></div>
                    </div>
                </div>
            </div>
            <footer class="bg-white sticky-footer">
                <div class="container my-auto">
                    <div class="text-center my-auto copyright"><span>Copyright © ElectroRehab 2022</span></div>
                </div>
            </footer>
        </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
    </div>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/theme.js"></script>
</body>

</html>