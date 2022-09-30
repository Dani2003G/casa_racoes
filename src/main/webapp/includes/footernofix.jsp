<footer class="py-3 bg-primary">
    <h6 class="text-center text-white">@MadeBy Dani2003G</h6>
    <%if (pg.equals("prod")) {%>
    <script src="../js/bootstrap.bundle.min.js"></script>
    <%} else {%>
    <script src="js/bootstrap.bundle.min.js"></script>
    <%}%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script type="text/javascript" src="../js/jquery.mask.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#preco').mask('#.##0,00', {reverse: true});
        });
    </script>
</footer>