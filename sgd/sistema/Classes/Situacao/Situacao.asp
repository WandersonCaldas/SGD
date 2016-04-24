<!-- #include virtual="/sgd/include/conexao.asp" -->
<%       
class cSituacao
    function GetSituacao()        
        set GetSituacao = oRecordSet("SELECT * FROM tbl_situacao WHERE cod_ativo = 1 ORDER BY txt_situacao")        
    end function

    sub ComboGetSituacao()
        dim rsSituacao

        set rsSituacao = GetSituacao() 

        if not rsSituacao.eof then %>
            <% if instr(request.ServerVariables("SCRIPT_NAME"), "Default.asp") = 0 then %>
                <label><% =application("lb_situacao") %></label> 
                <% txt_class = "class=""form-control""" %>                
            <% end if %>
            <select <% =txt_class %> id="cod_situacao" name="cod_situacao"> <%
                if instr(request.ServerVariables("SCRIPT_NAME"), "Default.asp") > 0 then %>
                    <option value=""></option>
                <% end if
                do while not rsSituacao.eof %>            
                    <option value="<% =rsSituacao("id_situacao") %>"><% =rsSituacao("txt_situacao") %></option> <%
                rsSituacao.movenext : loop %>
            </select> <%
        end if

        rsSituacao.close()
        set rsSituacao = nothing
    end sub
end class
%>