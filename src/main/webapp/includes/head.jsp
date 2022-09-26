<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Bootstrap -->
    <%
        String pg = request.getParameter("pg");
        if(pg == null) {pg = "";}
        String mod = request.getParameter("mod");
        if(mod == null) {mod = "";}
        String idS = request.getParameter("id");
        int id = 0;
        String err = request.getParameter("err");
        if(err == null) {err = "";}
        String sus = request.getParameter("sus");
        if(sus == null) {sus = "";}
        if(idS != null) {
            id = Integer.parseInt(idS);
        }
    if(pg.equals("prod")) {%>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
    <%} else {%>
        <link href="css/bootstrap.min.css" rel="stylesheet">
    <%}%>
</head>
