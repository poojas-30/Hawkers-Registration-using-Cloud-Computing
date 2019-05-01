<%-- 
    Document   : hawkins
    Created on : 17 Apr, 2017, 6:43:55 PM
    Author     : POOJA
--%>

<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
    <title>Hawker's Registration WebSite</title>
    <!-- BOOTSTRAP CORE STYLE  -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONT AWESOME ICONS  -->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLE  -->
    <link href="assets/css/style.css" rel="stylesheet" />
     <!-- HTML5 Shiv and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <header>
        <div class="container">
            <div class="row">


            </div>
        </div>
    </header>
    <!-- HEADER END-->
    <div class="navbar navbar-inverse set-radius-zero">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">

                    <img src="assets/img/logo.jpg" width="180" height="120"/>
                </a>

            </div>

            <div class="left-div">
                <div class="user-settings-wrapper">
                    <ul class="nav">

                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                                <span class="glyphicon glyphicon-user" style="font-size: 25px;"></span>
                            </a>
                            
                        </li>


                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- LOGO HEADER END-->
    <section class="menu-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="navbar-collapse collapse ">
                        <ul id="menu-top" class="nav navbar-nav navbar-right">
                            <li><a href="home.jsp">Search by UUID</a></li>
                            <li><a class="active" href="locs.jsp">Search by Location</a></li>
                            <li><a href="licen.jsp">License Renewal</a></li>
                            <li><a href="viewhawk.jsp">View Hawker</a></li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- MENU SECTION END-->
    <div class="content-wrapper">
        <div class="container">
<div class="row">
                <div class="col-md-6">
                  <!--   Kitchen Sink -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Show Hawkers Info
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                        <%
    String uids=request.getParameter("uuid");
     String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
        String DB_URL = "jdbc:mysql://localhost:3306/hawkdb";
        String cardid="",sname="",midname="",fname="",uuid="",gend="",bplace="",btype="",timep="",zowner="";
        byte[] fileDwn=null;
        byte[] fileDwn2=null;
        String USER = "root";
        String PASS = "";
         Connection conn = null;
        PreparedStatement stmt = null;
         Class.forName("com.mysql.jdbc.Driver");
         conn = DriverManager.getConnection(DB_URL, USER, PASS);
         stmt = conn.prepareStatement("SELECT * FROM infodb WHERE cardid=?");
         stmt.setString(1,uids);
         ResultSet rs=null;
         rs=stmt.executeQuery();
         while(rs.next()){
            cardid=rs.getString("cardid");
            sname=rs.getString("sname");
            midname=rs.getString("mname");
            gend=rs.getString("gend");
            bplace=rs.getString("bplace");
            btype=rs.getString("typbiz");
            timep=rs.getString("tpr");
            zowner=rs.getString("ownr");
            fileDwn=rs.getBytes("picx");  
            fileDwn2=rs.getBytes("sigx");
            FileOutputStream fos=null;
                  String srwex=request.getServletContext().getRealPath("imgs");
                  File fsx = new File(srwex+File.separator+cardid+".jpg");
                  fos = new FileOutputStream(fsx);
                  String stp=fsx.getPath()+cardid+".jpg";
                  fos.write(fileDwn);
                  

 FileOutputStream fos2=null;
                  String srwex2=request.getServletContext().getRealPath("imgs");
                  File fsx2 = new File(srwex+File.separator+cardid+"sign"+".jpg");
                  fos2 = new FileOutputStream(fsx2);
                  fos2.write(fileDwn2);
                  String sts=fsx.getPath()+cardid+"sign"+".jpg";

        %>
    
                                       
                                    <tbody>
                                        <tr>
                                            <td>CARD ID</td>
                                            <td><%=cardid%></td>
                                        </tr>
                                        <tr>
                                            <td>Surname</td>
                                            <td><%=sname%></td>
                                        </tr>
                                        <tr>
                                            <td>Middle Name</td>
                                            <td><%=midname%></td>
                                        </tr>
                                        <tr>
                                            <td>Gender</td>
                                            <td><%=gend%></td>
                                        </tr>                                  
                                        <tr>
                                            <td>Business Place</td>
                                            <td><%=bplace%></td>
                                        </tr>
                                        <tr>
                                            <td>Business Type</td>
                                            <td><%=btype%></td>
                                        </tr>
                                        <tr>
                                            <td>License Time Period</td>
                                            <td><%=timep%></td>
                                        </tr>
                                        <tr>
                                            <td>Zone Owner</td>
                                            <td><%=zowner%></td>
                                        </tr>
                                        <tr>
                                            <td>Photo ID of Hawker</td>
                                            <td><img src=<%=stp%>></td>
                                        </tr>
                                        <tr>
                                            <td>Sign of Hawker</td>
                                            <td><img src=<%=sts%>></td>
                                        </tr>
    <%
         }
    %>                        
       </tbody>
                                </table>
                           
    
                            </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="alert alert-warning">
                        
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- CONTENT-WRAPPER SECTION END-->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    &copy; 2017 Hawkers 
                </div>

            </div>
        </div>
    </footer>
    <!-- FOOTER SECTION END-->
    <!-- JAVASCRIPT AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
    <!-- CORE JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.11.1.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="assets/js/bootstrap.js"></script>
</body>
</html>
