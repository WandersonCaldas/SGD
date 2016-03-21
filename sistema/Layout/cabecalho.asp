<% sub Cabecalho() %>  
    <% call VerificaSessao() %>  
    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>SGD</title>
	    <!-- BOOTSTRAP STYLES-->
        <link href="/sistema/assets/css/bootstrap.css" rel="stylesheet" />
         <!-- FONTAWESOME STYLES-->
        <link href="/sistema/assets/css/font-awesome.css" rel="stylesheet" />
         <!-- MORRIS CHART STYLES-->
        <link href="/sistema/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
        <link href="/sistema/assets/css/custom.css" rel="stylesheet" />
        <!-- GOOGLE FONTS-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
        <!-- JQUERY -->
        <script src="../../include/jquery/jquery-1.10.1.js"></script>              
        <!--FUNÇÕES JS -->
        <script src="../../include/javascript/Funcao.js"></script>
    </head>
    <body>
        <div id="wrapper">
            <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>                   
                    <a class="navbar-brand" href="/sistema/default.asp"><% =RetornaNomeUsuario(Session("cod_usuario")) %></a> 
                </div>
                <div style="color: white; 
                    padding: 15px 50px 5px 50px;
                    float: right;
                    font-size: 16px;"> <% =now %> &nbsp; <a href="/../logout.asp" class="btn btn-danger square-btn-adjust">Sair</a> </div>        
            </nav>  
            <!-- /. NAV TOP  -->
            <nav class="navbar-default navbar-side" role="navigation">
                <div class="sidebar-collapse">
                    <ul class="nav" id="main-menu">
				        <li class="text-center">
                            <img src="/sistema/assets/img/find_user.png" class="user-image img-responsive"/>
					    </li>
                        <li>
                             <a href="#"> 
                                <% =application("lb_demandas") %><span class="fa arrow"></span>
                            </a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#"><% =application("lb_listagem") %></a>
                                </li>                               
                            </ul>
                        </li>									                        	                         					                   
                        <li>
                            <a href="#"> 
                                <% =application("lb_usuarios") %><span class="fa arrow"></span>
                            </a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/sistema/usuario/listagem.asp"><% =application("lb_listagem") %></a>
                                </li>                               
                            </ul>
                        </li>  
                        <li >
                            <a   href="#"> <% =application("lb_relatorios") %><span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">-</a>
                                </li>     
                                <li>
                                    <a href="#">-</a>
                                </li>                               
                            </ul>
                        </li>	                    
                    </ul>
               
                </div>
            
            </nav>
            <!-- /. NAV SIDE  -->
<% end sub %>

<% sub Titulo(byval texto) 
    dim txt_endereco, a_txt_endereco, i, txt_endereco_2, txt_endereco_direcionar
    dim modulo, a_texto

    txt_endereco = request.ServerVariables("PATH_INFO")  
    
    a_txt_endereco = split(txt_endereco, "/")
    
    txt_endereco_2 = a_txt_endereco(ubound(a_txt_endereco))  

    modulo = a_txt_endereco(ubound(a_txt_endereco) - 1)

    txt_endereco_direcionar = replace(txt_endereco, txt_endereco_2, "Listagem.asp")

    a_texto = split(texto, ">")
    
%>
    <div class="row">
        <div class="col-md-12">
            <h2><a href="<% =txt_endereco_direcionar %>"><font color="red"><% =a_texto(0) %></font></a> > <% =a_texto(1) %></h2>                                                 
        </div>
    </div>
<% end sub %>