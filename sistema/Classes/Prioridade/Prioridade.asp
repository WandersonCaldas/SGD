<!-- #include virtual="include/conexao.asp" -->
<%       
class cPrioridade
    function GetPrioridades()        
        set GetPrioridades = oRecordSet("SELECT * FROM tbl_prioridade WHERE cod_ativo = 1")        
    end function
end class
%>