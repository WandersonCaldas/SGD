function retornarCancelar(windowModal) {
     var toClose = windowModal.parent;
     if( toClose == null) {
     	toClose = windowModal;
     }
     var toFocus = windowModal.opener;

     toClose.close();
     if (toFocus != null) {
        toFocus.focus();
     }
}

function retornarResultado(windowModal) {
     //Salva as referencias, pois algumas se tornam null depois do close
     var toClose = windowModal.parent;
     if( toClose == null) {
     	toClose = windowModal;
     }
     var toFocus = windowModal.opener;
     var cback = windowModal.callback;
     if (cback == null) {
     	cback = windowModal.parent.callback;
     }

     toClose.close();
     if (toFocus != null) {
        toFocus.focus();
     }
     if (cback != null) {
        //args = new Array(arguments.length -1);
        //for (i =0; i < args.length; i++) {
        //    args[i] = arguments[i+1];
        //}
        //windowModal.callback.apply(null, args);
        //O ideal seria usar o código genérico acima, mas ele dá erro no IE :-(
        if (arguments.length == 1) {
            cback();
        } else if (arguments.length == 2) {
            cback(arguments[1]);
        } else if (arguments.length == 3) {
            cback(arguments[1], arguments[2]);
        } else if (arguments.length == 4) {
            cback(arguments[1], arguments[2], arguments[3]);
        } else if (arguments.length == 5) {
            cback(arguments[1], arguments[2], arguments[3], arguments[4]);
        } else if (arguments.length == 6) {
            cback(arguments[1], arguments[2], arguments[3], arguments[4], arguments[5]);
        } else {
            cback(arguments[1], arguments[2], arguments[3], arguments[4], arguments[5], arguments[6]);
        }
     }
     //Chama close novamente pois se houver uma chamada window.alert(), a janela é reaberta
     if (toClose) {
         toClose.close();
     }
     if (toFocus != null) {
        toFocus.focus();
     }
}

function JanelaModal(window_origem) {

    this.windowOrigem = window_origem;
    this.modalWin = "";
    
    //Cria um handle para tratar os casos de ganhar foco na janela de tras
    var me=this;
    
    this.invokeOnFocus = function () {
        //if (me.windowOrigem.navigator.appVersion.indexOf("MSIE")==-1)  { 
           if (me.modalWin!=null && !me.modalWin.closed )  { 
            //me.windowOrigem.blur(); 
            me.modalWin.focus(); 
           } 
        //} 
    }
}

JanelaModal.prototype.setOnClose = function( funcao_callback) {
    this.funcaoCallback = funcao_callback;
}

JanelaModal.prototype.show = function( sURL, vArguments, sFeatures ) {
    if (sURL==null||sURL=='')  
    { 
        alert ("Invalid URL input."); 
        return false; 
    } 
    if (vArguments==null||vArguments=='') 
    { 
        vArguments=''; 
    } 
    if (sFeatures==null||sFeatures=='') 
    { 
        //default features 
        sFeatures= 'dialogHeight: 450px; dialogWidth: 1049px; dialogTop: 646px; dialogLeft: 4px; edge: Raised; center: Yes; help: Yes; resizable: Yes; status: Yes;';
    } 
    //if (window.navigator.appVersion.indexOf("MSIE")!=-1) 
    //{ 
    //   window.showModalDialog ( sURL, vArguments, sFeatures ); 
    //    return false; 
    //} 
    var sFeatures = sFeatures.replace(/ /gi,''); 
    var aFeatures = sFeatures.split(";"); 
    var sWinFeat = "directories=0,menubar=0,titlebar=0,toolbar=0,"; 
    for ( x in aFeatures ) 
    { 
        aTmp = aFeatures[x].split(":"); 
        sKey = aTmp[0].toLowerCase(); 
        sVal = aTmp[1]; 
        switch (sKey) 
        { 
            case "dialogheight": 
                sWinFeat += "height="+sVal+", "; 
                pHeight = sVal.replace("px",""); 
                break; 
            case "dialogwidth": 
                sWinFeat += "width="+sVal+", "; 
                pWidth = sVal.replace("px",""); 
                break; 
            case "dialogtop": 
                sWinFeat += "screenY="+sVal+", "; 
                break; 
            case "dialogleft": 
                sWinFeat += "screenX="+sVal+", "; 
                break; 
            case "scroll": 
                sWinFeat += "scrollbars="+sVal+", "; 
                break; 
            case "resizable": 
                sWinFeat += "resizable="+sVal+", "; 
                break; 
            case "status": 
                sWinFeat += "status="+sVal+", "; 
                break; 
            case "center": 
                if ( sVal.toLowerCase() == "yes" ) 
                { 
                    sWinFeat += "screenY="+((this.windowOrigem.screen.availHeight-pHeight)/2)+", "; 
                    sWinFeat += "screenX="+((this.windowOrigem.screen.availWidth-pWidth)/2)+", "; 
                } 
                break; 
        } 
    } 
    
    this.modalWin=this.windowOrigem.open(String(sURL),"",sWinFeat); 
    if (vArguments!=null&&vArguments!='') 
    { 
        this.modalWin.dialogArguments=vArguments; 
    } 
    
    this.windowOrigem.document.body.onfocus = this.invokeOnFocus;

    if (this.funcaoCallback != null) {
    	this.modalWin.callback = this.funcaoCallback;
    }
    if (this.modalWin.opener == null) {
        this.modalWin.opener = this.windowOrigem;
    }
    
    return true;
}
