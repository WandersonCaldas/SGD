<%   
public sub js_alert(txt_mensagem)
	if instr(txt_mensagem, "'") then txt_mensagem = replace(txt_mensagem, "'", "\'")
	response.write "<script language=javascript> alert('" & txt_mensagem & "');</script>"
end sub
  
public sub js_go(txt_pagina)
	response.write "<script language=javascript> self.location.href = '" & txt_pagina & "';</script>"
end sub  

public function oRecordSet(sql)
    dim Recordset
    set Recordset = Server.CreateObject("ADODB.recordset")
    Recordset.Open sql, conexao
    
    set oRecordSet = Recordset
end function

public sub Executar(sql)    
    if sql <> "" then conexao.Execute(sql)    
end sub

public function LabelAtivo(byval cod_ativo)
    dim retorno : retorno = ""

    if cint(cod_ativo) = 1 then
        retorno = "<font color='green'><b>SIM</b></font>"
    elseif cint(cod_ativo) = 0 then
        retorno = "<font color='red'><b>NÃO</b></font>"
    end if

    LabelAtivo = retorno
end function
%>