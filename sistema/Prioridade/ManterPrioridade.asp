<!-- #include virtual="sistema/Classes/Prioridade/Prioridade.asp" -->
<%       
Response.Charset = "ISO-8859-1"

dim oPrioridade : set oPrioridade = new cPrioridade

sub ComboGetPrioridades()
    call oPrioridade.ComboGetPrioridades()
end sub

%>