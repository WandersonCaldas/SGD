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
%>