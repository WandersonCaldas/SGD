<% sub Rodape() %>     
         <!-- /. PAGE WRAPPER  -->
        </div>

        <!-- /. WRAPPER  -->
        <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
        <!-- JQUERY SCRIPTS -->
        <script src="/sgd/sistema/assets/js/jquery-1.10.2.js"></script>
          <!-- BOOTSTRAP SCRIPTS -->
        <script src="/sgd/sistema/assets/js/bootstrap.min.js"></script>
        <!-- METISMENU SCRIPTS -->
        <script src="/sgd/sistema/assets/js/jquery.metisMenu.js"></script>
         <!-- MORRIS CHART SCRIPTS -->
         <script src="/sgd/sistema/assets/js/morris/raphael-2.1.0.min.js"></script>
        <script src="/sgd/sistema/assets/js/morris/morris.js"></script>
          <!-- CUSTOM SCRIPTS -->
        <script src="/sgd/sistema/assets/js/custom.js"></script>    
    </body>
    </html> <%
    conexao.close() 
    set conexao = nothing        
    %>
<% end sub %>

<% sub Rodape2() %>
     <!-- /. PAGE WRAPPER  -->
         <!-- /. WRAPPER  -->
        <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
        <!-- JQUERY SCRIPTS -->
        <script src="/sgd/sistema/assets/js/jquery-1.10.2.js"></script>
          <!-- BOOTSTRAP SCRIPTS -->
        <script src="/sgd/sistema/assets/js/bootstrap.min.js"></script>
        <!-- METISMENU SCRIPTS -->
        <script src="/sgd/sistema/assets/js/jquery.metisMenu.js"></script>
         <!-- DATA TABLE SCRIPTS -->
        <script src="/sgd/sistema/assets/js/dataTables/jquery.dataTables.js"></script>
        <script src="/sgd/sistema/assets/js/dataTables/dataTables.bootstrap.js"></script>
            <script>
                $(document).ready(function () {
                    $('#dataTables-example').dataTable();
                });
        </script>
             <!-- CUSTOM SCRIPTS -->
        <script src="/sgd/sistema/assets/js/custom.js"></script>

    </body>
    </html><%
    conexao.close() 
    set conexao = nothing        
    %>
<% end sub %>