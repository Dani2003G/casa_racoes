<footer class="py-3 mt-3 bg-primary <%if(pg.equals("ini")){%> fixed-bottom <%}%> ">
    <h6 class="text-center text-white">@MadeBy Dani2003G</h6>
    <%if(pg.equals("prod")) {%>
        <script src="../js/bootstrap.bundle.min.js"></script>
    <%} else {%>
        <script src="js/bootstrap.bundle.min.js"></script>
    <%}%>
</footer>