<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Bootstrap -->
    <%
        String pg = request.getParameter("pg");
        if(pg == null) {pg = "";}
    if(pg.equals("prod")) {%>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
    <%} else {%>
        <link href="css/bootstrap.min.css" rel="stylesheet">
    <%}%>
</head>
