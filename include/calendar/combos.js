<!--
/*objeto Selects*/

function Selects(comboPadre,comboHijo){
	var comboPadre;
	var comboHijo;
	var padres;
	var cantPadres;
	var comboPadre;
	var comboHijo;

	this.comboPadre=comboPadre;
	this.comboHijo=comboHijo;

	this.cantPadres=0;
	this.padres=new Array();

//	Funciones
	this.addPadre=addPadre;
	this.agregaHijo=agregaHijo;
	this.mostrarPadres=mostrarPadres;
	this.llenaHijo=llenaHijo;
	this.llenaPadre=llenaPadre;
//	fin de Funciones
}

/*Funcion que llena el combo padre con los datos agregados*/
function llenaPadre(inicial,seleccion){
	var i;

	eval('document.all.'+this.comboPadre+'.length=0');
	eval('document.all.'+this.comboPadre+'.length='+(this.cantPadres+1));
	
	eval('document.all.'+this.comboPadre+'.options[0].value=0');
	eval('document.all.'+this.comboPadre+'.options[0].text="'+inicial+'"');
	
	eval('document.all.'+this.comboPadre+'.options[0].defaultSelected=false');
	eval('document.all.'+this.comboPadre+'.options[0].selected=false');
	
	if((seleccion=='')||(seleccion==0)){
		eval('document.all.'+this.comboPadre+'.options[0].selected=true');
	}	
	
		
	for(i=1;i < this.cantPadres+1;i++){
		eval('document.all.'+this.comboPadre+'.options['+i+'].value='+this.padres[i-1].id);
		eval('document.all.'+this.comboPadre+'.options['+i+'].text="'+this.padres[i-1].nombre+'"');
		
		if((seleccion==this.padres[i-1].id)){
			eval('document.all.'+this.comboPadre+'.options['+i+'].selected=true');
		}
	}
}

/*funcion que selecciona el objeto padre para que complete el combo hijo*/
function llenaHijo(idPadre,defecto){
	var i;
	var elPadre;

	i=0;
	
	while((i < this.cantPadres) && (this.padres[i].id != idPadre)){
		i++;
	}

	
	if(i < this.cantPadres){//si lo encontro. lo usa
		elPadre = this.padres[i];	
		elPadre.llenaCombo(this.comboHijo,defecto);
	}else{
		return;
	}
}


/*imprime los datos de los padres -test-*/
function mostrarPadres(){
	var i;
	for(i=0;i<this.cantPadres;i++){
		document.write('padre['+i+']: '+this.padres[i].nombre+' - '+this.padres[i].cantHijos+'<br>');
		this.padres[i].mostrarHijos();
	}
}

/*agregar un padre a la coleccion*/
function addPadre(id,nombre){
	this.padres[this.cantPadres]=new Padre(id,nombre);
	this.cantPadres++;
	return this.padres[(this.cantPadres)-1];
}

/*selecciona al padre y le agrega un hijo*/
function agregaHijo(padre,nombrePadre, idHijo,valorHijo){
	var i;
	var elPadre;

	i=0;
	
	while((i < this.cantPadres) && (this.padres[i].id != padre)){
		i++;
	}

	
	if(i < this.cantPadres){//si lo encontro. lo usa
		elPadre = this.padres[i];	
	}else{//sino, lo agrega
		elPadre = this.addPadre(padre,nombrePadre);
	}

	elPadre.addHijo(idHijo, valorHijo);//agrega al hijo
}


/*Padre*/
function Padre(id,nombre){
	var id;
	var nombre;
	var hijos;
	var hijosNombre;
	var cantHijos;

	this.hijos = new Array();
	this.hijosNombre = new Array(); 
	this.cantHijos = 0;	
	this.id = id;	
	this.nombre=nombre;
	
//	Funciones
	this.addHijo = addHijo;
	this.mostrarHijos=mostrarHijos;
	this.llenaCombo=llenaCombo;
//	fin de Funciones
}


/*llena el combo hijo con los valores de sus hijos*/
function llenaCombo(nombreCombo,defecto){
	var i;

	eval('document.all.'+nombreCombo+'.length=0');
	eval('document.all.'+nombreCombo+'.length='+(this.cantHijos+1));
	
	eval('document.all.'+nombreCombo+'.options[0].value=0');
	eval('document.all.'+nombreCombo+'.options[0].text="'+defecto+'"');
		
	for(i=1;i < this.cantHijos+1;i++){
		eval('document.all.'+nombreCombo+'.options['+i+'].value='+this.hijos[i-1]);
		eval('document.all.'+nombreCombo+'.options['+i+'].text="'+this.hijosNombre[i-1]+'"');
	}
}


/*agrega un hijo*/
function addHijo(id, valor){
	this.hijos[this.cantHijos] = id;
	this.hijosNombre[this.cantHijos] = valor;
	this.cantHijos++;
}


/*imprime los valores de los hijos*/
function mostrarHijos(){
	var i;
	for(i=0;i < this.cantHijos;i++){
		document.write('&nbsp;&nbsp;&nbsp;hijos['+i+']: '+this.hijos[i]+' - '+this.hijosNombre[i]+'<br>');
	}
}
-->