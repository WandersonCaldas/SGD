<!--
//Bloco de código para esconder e mostra form
var Ver4 = parseInt(navigator.appVersion) >= 4
var IE4 = ((navigator.userAgent.indexOf("MSIE") != -1) && Ver4)
var block = "formulario";
function esconde() {	document.form.style.visibility = "hidden" }
function mostra() { document.form.style.visibility = "visible" }
//Bloco de código para esconder e mostra form


// Código para o teclado 
function tecladown (digito){
	if (digito == ''){
		document.form.senha.value = '';
		return;	
	}
	var pass = document.form.senha.value;
	if (pass.length >= 8){
		return;
	}
	document.form.senha.value = document.form.senha.value + digito;
}
function teclaclick(tecla){
	return false;
}
function teclaup(tecla){
	tecladown(tecla);
}
// --


// -- Contador para objeto TextArea.
function limita(campo){
	var tamanho = document.form[campo].value.length;
	var tex=document.form[campo].value;
	if (tamanho>=1539) {
		document.form[campo].value=tex.substring(0,1539); 
	}
	return true;
}

function contacampo(campo, tamtxt) {
document.form[tamtxt].value =  1540-document.form[campo].value.length;
}
// --



function SetHelp(txt) { help.innerText = txt ; }

function main(campofoco) { 
	if ( campofoco == '' || document.form.elements.length == 0 ) 
		return false;
			
	var num = parseInt(campofoco);

	if ( num || num == 0 )
	{
		if ( document.form[num] )
			document.form[num].focus();
	}
	else 
	{
		if ( (campofoco == "senhaConta" || campofoco == "senhaAtual") && document.applets["tclJava"] ) 
			document.applets["tclJava"].setFocus();
		else if ( document.form[campofoco] )
			document.form[campofoco].focus();
	}
}

function Apaga(){
	if (document.form.elements.length != 0)
		for (i = 0; i < document.form.elements.length; i++)
		{
			if( document.form[i].type != "hidden" )
				document.form[i].value="";
		}
}


var da = (document.all) ? 1 : 0;
var pr = (window.print) ? 1 : 0;
var mac = (navigator.userAgent.indexOf("Mac") != -1); 

function printPage()
{
  if (pr) // NS4, IE5
    window.print()
  else if (da && !mac) // IE4 (Windows)
    vbPrintPage()
  else // other browsers
    alert("Desculpe seu browser não suporta esta função. Por favor utilize a barra de trabalho para imprimir a página.");
  return false;
}

if (da && !pr && !mac) with (document) {
  writeln('<OBJECT ID="WB" WIDTH="0" HEIGHT="0" CLASSID="clsid:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>');
  writeln('<' + 'SCRIPT LANGUAGE="VBScript">');
  writeln('Sub window_onunload');
  writeln('  On Error Resume Next');
  writeln('  Set WB = nothing');
  writeln('End Sub');
  writeln('Sub vbPrintPage');
  writeln('  OLECMDID_PRINT = 6');
  writeln('  OLECMDEXECOPT_DONTPROMPTUSER = 2');
  writeln('  OLECMDEXECOPT_PROMPTUSER = 1');
  writeln('  On Error Resume Next');
  writeln('  WB.ExecWB OLECMDID_PRINT, OLECMDEXECOPT_DONTPROMPTUSER');
  writeln('End Sub');
  writeln('<' + '/SCRIPT>');
}

function FormataDado(campo,tammax,pos,teclapres){
	var tecla = teclapres.keyCode;
	vr = document.form[campo].value;
	vr = vr.replace( "-", "" );
	vr = vr.replace( ".", "" );
	vr = vr.replace( "/", "" );
	tam = vr.length ;

	if (tam < tammax && tecla != 8){ tam = vr.length + 1 ; }

	if (tecla == 8 ){ tam = tam - 1 ; }
			
	if ( tecla == 8 || tecla == 88 || tecla >= 48 && tecla <= 57 || tecla >= 96 && tecla <= 105 ){
		if ( tam <= 2 ){
	 		document.form[campo].value = vr ;}
		if ( tam > pos && tam <= tammax ){
			document.form[campo].value = vr.substr( 0, tam - pos ) + '-' + vr.substr( tam - pos, tam );}
	}
	//alert("campo: " + document.form[campo+1].name);
	if ( !teclapres.shiftKey && tecla == 9 && document.form[campo+1].name == "senhaConta" && document.applets['tclJava'] ){
		//alert("aki 1");
			document.applets['tclJava'].setFocus();
	}
}

function FormataValor(campo,tammax,teclapres) {
	var tecla = teclapres.keyCode;
	vr = document.form[campo].value;
	vr = vr.replace( "/", "" );
	vr = vr.replace( "/", "" );
	vr = vr.replace( ",", "" );
	vr = vr.replace( ".", "" );
	vr = vr.replace( ".", "" );
	vr = vr.replace( ".", "" );
	vr = vr.replace( ".", "" );
	tam = vr.length;

	if (tam < tammax && tecla != 8){ tam = vr.length + 1 ; }

	if (tecla == 8 ){	tam = tam - 1 ; }
		
	if ( tecla == 8 || tecla >= 48 && tecla <= 57 || tecla >= 96 && tecla <= 105 ){
		if ( tam <= 2 ){ 
	 		document.form[campo].value = vr ; }
	 	if ( (tam > 2) && (tam <= 5) ){
	 		document.form[campo].value = vr.substr( 0, tam - 2 ) + ',' + vr.substr( tam - 2, tam ) ; }
	 	if ( (tam >= 6) && (tam <= 8) ){
	 		document.form[campo].value = vr.substr( 0, tam - 5 ) + '.' + vr.substr( tam - 5, 3 ) + ',' + vr.substr( tam - 2, tam ) ; }
	 	if ( (tam >= 9) && (tam <= 11) ){
	 		document.form[campo].value = vr.substr( 0, tam - 8 ) + '.' + vr.substr( tam - 8, 3 ) + '.' + vr.substr( tam - 5, 3 ) + ',' + vr.substr( tam - 2, tam ) ; }
	 	if ( (tam >= 12) && (tam <= 14) ){
	 		document.form[campo].value = vr.substr( 0, tam - 11 ) + '.' + vr.substr( tam - 11, 3 ) + '.' + vr.substr( tam - 8, 3 ) + '.' + vr.substr( tam - 5, 3 ) + ',' + vr.substr( tam - 2, tam ) ; }
	 	if ( (tam >= 15) && (tam <= 17) ){
	 		document.form[campo].value = vr.substr( 0, tam - 14 ) + '.' + vr.substr( tam - 14, 3 ) + '.' + vr.substr( tam - 11, 3 ) + '.' + vr.substr( tam - 8, 3 ) + '.' + vr.substr( tam - 5, 3 ) + ',' + vr.substr( tam - 2, tam ) ;}
	}
		
	for (var ct = 0; ct < document.form.elements.length; ct++) {
		if (document.form.elements[ct].name == document.form.elements[campo].name) {
			if ( !teclapres.shiftKey && tecla == 9 && document.form.elements[ct+1] && document.form.elements[ct+1].name == "senhaConta" && document.applets['tclJava'] ){
				document.applets['tclJava'].setFocus();
			}	
		}
	}
}

function SaltaCampo (campo,prox,tammax,teclapres){
	var tecla = teclapres.keyCode;
	vr = document.form[campo].value;
	if( tecla == 109 || tecla == 188 || tecla == 110 || tecla == 111 || tecla == 223 || tecla == 108 ){
		document.form[campo].value = vr.substr( 0, vr.length - 1 ); }
	else{
	 	vr = vr.replace( "-", "" );
	 	vr = vr.replace( "/", "" );
	 	vr = vr.replace( "/", "" );
	 	vr = vr.replace( ",", "" );
	 	vr = vr.replace( ".", "" );
	 	vr = vr.replace( ".", "" );
	 	vr = vr.replace( ".", "" );
	 	vr = vr.replace( ".", "" );
	 	tam = vr.length;	
		
	 	if (tecla != 0 && tecla != 9 && tecla != 16 ){
		
			if ( tam == tammax ){
				if ( prox == "senhaConta" || (document.form.elements[prox] && document.form.elements[prox].name == "senhaConta"))
				{
					if ( document.applets['tclJava'] )
						document.applets['tclJava'].setFocus();
					else if ( document.form.senhaConta )
						document.form.senhaConta.focus();
				}
				else if ( document.form[prox] )
					document.form[prox].focus();
			}
		}
	}
}

function FormataData(campo,teclapres) {
	var tecla = teclapres.keyCode;
	vr = document.form[campo].value;
	vr = vr.replace( ".", "" );
	vr = vr.replace( "/", "" );
	vr = vr.replace( "/", "" );
	tam = vr.length + 1;

	if ( tecla != 9 && tecla != 8 ){
		if ( tam > 2 && tam < 5 )
			document.form[campo].value = vr.substr( 0, tam - 2  ) + '/' + vr.substr( tam - 2, tam );
		if ( tam >= 5 && tam <= 10 )
			document.form[campo].value = vr.substr( 0, 2 ) + '/' + vr.substr( 2, 2 ) + '/' + vr.substr( 4, 4 ); 
	}
	
	for (var ct = 0; ct < document.form.elements.length; ct++) {
		if (document.form.elements[ct].name == document.form.elements[campo].name) {
			if ( !teclapres.shiftKey && tecla == 9 && document.form[ct+1].name == "senhaConta" && document.applets['tclJava'] ){
				document.applets['tclJava'].setFocus();
			}	
		}
	}
}

function FormataMesAno(Campo,teclapres) {
	var tecla = teclapres.keyCode;
	vr = document.form[Campo].value;
	vr = vr.replace( ".", "" );
	vr = vr.replace( "/", "" );
	vr = vr.replace( "/", "" );
	tam = vr.length + 1;

	if ( tecla != 9 && tecla != 8 ){
		if ( tam > 2 && tam < 7 )
			document.form[Campo].value = vr.substr( 0, 2 ) + '/' + vr.substr( 2, tam ); }
}

function FormataPercentual(campo,tammax,teclapres) {
	var tecla = teclapres.keyCode;
	vr = document.form[campo].value;
	vr = vr.replace( "/", "" );
	vr = vr.replace( "/", "" );
	vr = vr.replace( ",", "" );
	vr = vr.replace( ".", "" );
	vr = vr.replace( ".", "" );
	vr = vr.replace( ".", "" );
	vr = vr.replace( ".", "" );
	tam = vr.length;

	if (tam < tammax && tecla != 8){ tam = vr.length + 1 ; }

	if (tecla == 8 ){	tam = tam - 1 ; }
		
	if ( tecla == 8 || tecla >= 48 && tecla <= 57 || tecla >= 96 && tecla <= 105 ){
		if ( tam <= 3 ){ 
	 		document.form[campo].value = vr ; }
	 	if ( (tam > 3) && (tam <= 6) ){
	 		document.form[campo].value = vr.substr( 0, tam - 3 ) + ',' + vr.substr( tam - 3, tam ) ; }
	}		
	
}


function VerificaJava()
 	{
	if (navigator.javaEnabled())
		document.form.javas.value="sim"
	}

function FormataCpf(campo,tammax,teclapres) {
	var tecla = teclapres.keyCode;
	vr = document.form[campo].value;
	vr = vr.replace( "/", "" );
	vr = vr.replace( "/", "" );
	vr = vr.replace( ",", "" );
	vr = vr.replace( ".", "" );
	vr = vr.replace( ".", "" );
	vr = vr.replace( ".", "" );
	vr = vr.replace( ".", "" );
	vr = vr.replace( "-", "" );
	vr = vr.replace( "-", "" );
	vr = vr.replace( "-", "" );
	vr = vr.replace( "-", "" );
	vr = vr.replace( "-", "" );
	tam = vr.length;

	if (tam < tammax && tecla != 8){ tam = vr.length + 1 ; }

	if (tecla == 8 ){	tam = tam - 1 ; }
		
	if ( tecla == 8 || tecla >= 48 && tecla <= 57 || tecla >= 96 && tecla <= 105 ){
		if ( tam <= 2 ){ 
	 		document.form[campo].value = vr ; }
	 	if ( (tam > 2) && (tam <= 5) ){
	 		document.form[campo].value = vr.substr( 0, tam - 2 ) + '-' + vr.substr( tam - 2, tam ) ; }
	 	if ( (tam >= 6) && (tam <= 8) ){
	 		document.form[campo].value = vr.substr( 0, tam - 5 ) + '.' + vr.substr( tam - 5, 3 ) + '-' + vr.substr( tam - 2, tam ) ; }
	 	if ( (tam >= 9) && (tam <= 11) ){
	 		document.form[campo].value = vr.substr( 0, tam - 8 ) + '.' + vr.substr( tam - 8, 3 ) + '.' + vr.substr( tam - 5, 3 ) + '-' + vr.substr( tam - 2, tam ) ; }
	 	if ( (tam >= 12) && (tam <= 14) ){
	 		document.form[campo].value = vr.substr( 0, tam - 11 ) + '.' + vr.substr( tam - 11, 3 ) + '.' + vr.substr( tam - 8, 3 ) + '.' + vr.substr( tam - 5, 3 ) + '-' + vr.substr( tam - 2, tam ) ; }
	 	if ( (tam >= 15) && (tam <= 17) ){
	 		document.form[campo].value = vr.substr( 0, tam - 14 ) + '.' + vr.substr( tam - 14, 3 ) + '.' + vr.substr( tam - 11, 3 ) + '.' + vr.substr( tam - 8, 3 ) + '.' + vr.substr( tam - 5, 3 ) + '-' + vr.substr( tam - 2, tam ) ;}
	}		
}

function FormataCartaoCredito(campo,tammax,teclapres) {
	var tecla = teclapres.keyCode;
	vr = document.form[campo].value;

	if ( tecla == 8 || (tecla >= 48 && tecla <= 57) || (tecla >= 96 && tecla <= 105) )
	{
		vr = vr.replace( "/", "" );
		vr = vr.replace( "/", "" );
		vr = vr.replace( ",", "" );
		vr = vr.replace( ".", "" );
		vr = vr.replace( ".", "" );
		vr = vr.replace( ".", "" );
		vr = vr.replace( ".", "" );
		vr = vr.replace( "-", "" );
		vr = vr.replace( "-", "" );
		vr = vr.replace( "-", "" );
		vr = vr.replace( "-", "" );
		vr = vr.replace( "-", "" );
		tam = vr.length;

		if (tam < tammax && tecla != 8)
		   {tam = vr.length + 1 ; }

		if (tecla == 8 ) {tam = tam - 1 ; }

		if ( tam < 5 )
		   { document.form[campo].value = vr ; }
	 	if ( ( tam >  4 ) && ( tam < 9 ) )
		   { document.form[campo].value = vr.substr( 0, 4 ) + '.' + vr.substr( 4, tam-4 ) ; }
	 	if ( ( tam >  8 ) && ( tam < 13 ) )
		   { document.form[campo].value = vr.substr( 0, 4 ) + '.' + vr.substr( 4, 4 ) + '.' + vr.substr( 8, tam-4 ) ; }
	 	if ( tam > 12 )
		   { document.form[campo].value = vr.substr( 0, 4 ) + '.' + vr.substr( 4, 4 ) + '.' + vr.substr( 8, 4 ) + '.' + vr.substr( 12, tam-4 ); }
	}	
}

function FormataCgc(campo,tammax,teclapres) {
	var tecla = teclapres.keyCode;
	vr = document.form[campo].value;
	vr = vr.replace( "/", "" );
	vr = vr.replace( "/", "" );
	vr = vr.replace( "/", "" );
	vr = vr.replace( ",", "" );
	vr = vr.replace( ".", "" );
	vr = vr.replace( ".", "" );
	vr = vr.replace( ".", "" );
	vr = vr.replace( ".", "" );
	vr = vr.replace( ".", "" );
	vr = vr.replace( ".", "" );
	vr = vr.replace( ".", "" );
	vr = vr.replace( "-", "" );
	vr = vr.replace( "-", "" );
	vr = vr.replace( "-", "" );
	vr = vr.replace( "-", "" );
	vr = vr.replace( "-", "" );
	tam = vr.length;

	if (tam < tammax && tecla != 8){ tam = vr.length + 1 ; }

	if (tecla == 8 ){	tam = tam - 1 ; }
		
	if ( tecla == 8 || tecla >= 48 && tecla <= 57 || tecla >= 96 && tecla <= 105 ){
		if ( tam <= 2 ){ 
	 		document.form[campo].value = vr ; }
	 	if ( (tam > 2) && (tam <= 6) ){
	 		document.form[campo].value = vr.substr( 0, tam - 2 ) + '-' + vr.substr( tam - 2, tam ) ; }
	 	if ( (tam >= 7) && (tam <= 9) ){
	 		document.form[campo].value = vr.substr( 0, tam - 6 ) + '/' + vr.substr( tam - 6, 4 ) + '-' + vr.substr( tam - 2, tam ) ; }
	 	if ( (tam >= 10) && (tam <= 12) ){
	 		document.form[campo].value = vr.substr( 0, tam - 9 ) + '.' + vr.substr( tam - 9, 3 ) + '/' + vr.substr( tam - 6, 4 ) + '-' + vr.substr( tam - 2, tam ) ; }
	 	if ( (tam >= 13) && (tam <= 14) ){
	 		document.form[campo].value = vr.substr( 0, tam - 12 ) + '.' + vr.substr( tam - 12, 3 ) + '.' + vr.substr( tam - 9, 3 ) + '/' + vr.substr( tam - 6, 4 ) + '-' + vr.substr( tam - 2, tam ) ; }
	 	if ( (tam >= 15) && (tam <= 17) ){
	 		document.form[campo].value = vr.substr( 0, tam - 14 ) + '.' + vr.substr( tam - 14, 3 ) + '.' + vr.substr( tam - 11, 3 ) + '.' + vr.substr( tam - 8, 3 ) + '.' + vr.substr( tam - 5, 3 ) + '-' + vr.substr( tam - 2, tam ) ;}
	}		
}

function FormataTelefone(campo,tammax,teclapres) {
	var tecla = teclapres.keyCode;
	vr = document.form[campo].value;
	vr = vr.replace( "/", "" );
	vr = vr.replace( "/", "" );
	vr = vr.replace( ",", "" );
	vr = vr.replace( ".", "" );
	vr = vr.replace( ".", "" );
	vr = vr.replace( ".", "" );
	vr = vr.replace( ".", "" );
	vr = vr.replace( "-", "" );
	vr = vr.replace( "-", "" );
	vr = vr.replace( "-", "" );
	vr = vr.replace( "-", "" );
	vr = vr.replace( "-", "" );
	tam = vr.length;

	if (tam < tammax && tecla != 8){ tam = vr.length + 1 ; }

	if (tecla == 8 ){	tam = tam - 1 ; }
		
	if ( tecla == 8 || tecla >= 48 && tecla <= 57 || tecla >= 96 && tecla <= 105 ){
		if ( tam <= 2 ){ 
	 		document.form[campo].value = vr ; }
	 	if ( (tam > 4) ){
	 		document.form[campo].value = vr.substr( 0, tam - 4 ) + '-' + vr.substr( tam - 4, tam ) ; }
	}		
}

function getSenha() {
	if ( document.applets['tclJava'] ){
		var senha = document.applets['tclJava'].getSenha();
		document.form['senhaConta'].value = senha;
	}
}

function enviaSub() {
	document.form.submit();
	return false;
}


function mudaFoco(campo)
{
	if(campo == "98") {
		//var nb = document.form.elements[document.form.elements.length - 1].name;
		//if(nb.indexOf(".x"))
		//	nb = nb.substring(0,nb.length-2);
		//document.form.elements[nb].focus();
		return;
	}
	if( (campo == "senhaConta" || (document.form.elements[campo] && document.form.elements[campo].name == "senhaConta")) && document.applets['tclJava'] )
		document.applets.tclJava.setFocus();
	else if (document.form.elements[campo])
		document.form.elements[campo].focus();
}

function mostraBalao(mst) {
	if (mst) {
		document.all["balaoApplet"].style.visibility="visible";
	}
	else {
		document.all["balaoApplet"].style.visibility="hidden";
	}
}

function teclaTab(teclaPress) {
	if(teclaPress.keyCode == 9)
		focaApplet();
}

function focaApplet() {
	if (document.applets['tclJava'] ) {
		document.applets.tclJava.setFocus();
	}
}
	
function focaApplet2(nomeApplet) {
	if (document.applets[nomeApplet] ) {
		document.applets[nomeApplet].setFocus();
	}
}

function focaApplet3(prox,teclapres) {
	var tecla = teclapres.keyCode;
	if ( !teclapres.shiftKey && tecla == 9 && document.form.elements[prox] && document.form.elements[prox].name == "senhaConta" && document.applets['tclJava'] )
		document.applets['tclJava'].setFocus();
}

function setaCod(numCod) {
	if (document.form.elements['numCod'])
		document.form.elements['numCod'].value = numCod;
}

function setaQW(strT) {
	if (document.form.elements['texto'])
		document.form.elements['texto'].value = strT;
}

function executarLogin() {
	getSenha();
	enviaSub();
}

//-->
