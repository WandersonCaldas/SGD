<%   
public sub js_alert(txt_mensagem)
	if instr(txt_mensagem, "'") then txt_mensagem = replace(txt_mensagem, "'", "\'")
	response.write "<script language=javascript> alert('" & txt_mensagem & "');</script>"
end sub
  
public sub js_go(txt_pagina)
	response.write "<script language=javascript> self.location.href = '" & txt_pagina & "';</script>"
end sub  

public sub js_go_back(mensagem)
	Response.Write "<script language=""javascript""> alert('" & mensagem & "'); history.go(-1);</script>"
    Response.End
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

Function formatar_documento_numero(txt_numero, digito)
    Do While Len(txt_numero) < digito
        txt_numero = "0" & txt_numero
    Loop
    formatar_documento_numero = txt_numero
End Function

function remove_acento(byval texto)
	if texto <> "" then

	do while instr(texto, " ")
		texto = replace(texto, " ", "_")
	loop

	for contador = 59 to 64
		texto=replace(texto,chr(contador), "_")
	next

	texto=replace(texto,chr(91), "_")
	for contador = 93 to 96
		texto=replace(texto,chr(contador), "_")
	next

	for contador = 126 to 191
		texto=replace(texto,chr(contador), "")
	next

	texto=replace(texto,"á", "a")
	texto=replace(texto,"â", "a")
	texto=replace(texto,"ã", "a")
	texto=replace(texto,chr(227), "A")
	texto=replace(texto,"à", "a")
	texto=replace(texto,"ä", "a")
	texto=replace(texto,chr(194), "A")

	texto=replace(texto,"À", "A")
	texto=replace(texto,chr(192), "A")
	texto=replace(texto,"Á", "A")
	texto=replace(texto,chr(193), "A")
	texto=replace(texto,"Â", "A")
	texto=replace(texto,chr(194), "A")
	texto=replace(texto,"Ã", "A")
	texto=replace(texto,chr(195), "A")
	texto=replace(texto,"Ä", "A")
	texto=replace(texto,chr(196), "A")
	texto=replace(texto,"Å", "A")
	texto=replace(texto,chr(197), "A")

	texto=replace(texto,"Æ", "A")
	texto=replace(texto,chr(198), "_")

	texto=replace(texto,"Ç", "C")
	texto=replace(texto,chr(199), "C")

	texto=replace(texto,"È", "E")
	texto=replace(texto,chr(200), "E")
	texto=replace(texto,"É", "E")
	texto=replace(texto,chr(201), "E")
	texto=replace(texto,"Ê", "E")
	texto=replace(texto,chr(202), "E")
	texto=replace(texto,"Ë", "E")
	texto=replace(texto,chr(203), "E")

	texto=replace(texto,"é", "e")
	texto=replace(texto,"ê", "e")
	texto=replace(texto,"è", "e")
	texto=replace(texto,"ë", "e")
	texto=replace(texto,"í", "i")
	texto=replace(texto,"ì", "i")
	texto=replace(texto,"ï", "i")
	texto=replace(texto,"î", "i")

	texto=replace(texto,"Ì", "I")
	texto=replace(texto,chr(204), "I")
	texto=replace(texto,"Í", "I")
	texto=replace(texto,chr(205), "I")
	texto=replace(texto,"Î", "I")
	texto=replace(texto,chr(206), "I")
	texto=replace(texto,"Ï", "I")
	texto=replace(texto,chr(207), "I")

	texto=replace(texto,chr(208), "_")
	texto=replace(texto,chr(209), "_")
	texto=replace(texto,"ó", "o")
	texto=replace(texto,"ò", "o")
	texto=replace(texto,"ô", "o")
	texto=replace(texto,"õ", "o")
	texto=replace(texto,"ö", "o")

	texto=replace(texto,chr(210), "O")
	texto=replace(texto,"Õ", "O")
	texto=replace(texto,"Ô", "O")
	texto=replace(texto,"Ó", "O")
	texto=replace(texto,chr(211), "O")
	texto=replace(texto,"Ô", "O")
	texto=replace(texto,chr(212), "O")
	texto=replace(texto,"Ò", "O")
	texto=replace(texto,chr(213), "O")
	texto=replace(texto,"Ö", "O")
	texto=replace(texto,chr(214), "O")

	texto=replace(texto,"ú", "u")
	texto=replace(texto,"ù", "u")
	texto=replace(texto,"û", "u")
	texto=replace(texto,"ü", "u")

	texto=replace(texto,chr(215), "_")
	texto=replace(texto,chr(216), "_")

	texto=replace(texto,"Ù", "U")
	texto=replace(texto,chr(217), "U")
	texto=replace(texto,"Ú", "U")
	texto=replace(texto,chr(218), "U")
	texto=replace(texto,"Û", "U")
	texto=replace(texto,chr(219), "U")
	texto=replace(texto,"Ü", "U")
	texto=replace(texto,chr(220), "U")

	for contador = 221 to 230		
		texto=replace(texto,chr(contador), "")
	next

	texto=replace(texto,"ç", "c")
	texto=replace(texto,chr(231), "C")

	for contador = 232 to 255		
		texto=replace(texto,chr(contador), "")
	next

	texto=replace(texto,chr(124), "_")
		texto=replace(texto,chr(95)&chr(95), "_")
		do while instr(texto, " ")
		texto = replace(texto, "__", "_")
	loop

	end if
	remove_acento = texto
end function

Function limpar_comparacao(texto)
    If texto <> "" Then
        texto = Trim(texto)
        If IsNumeric(texto) Then
            texto = CLng(texto)
        End If
    End If
    limpar_comparacao = texto
End Function

Set rsConfigSistema = oRecordSet("SELECT * FROM tbl_sistema_configuracao")
if not rsConfigSistema.eof then
    application("txt_caminho_documento") = rsConfigSistema("txt_caminho_documento")
    application("txt_caminho_documento_curto") = rsConfigSistema("txt_caminho_documento_curto")
end if
rsConfigSistema.close()
set rsConfigSistema = nothing
%>