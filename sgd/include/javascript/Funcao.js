function go(obj) {
    var txt_pagina = obj.value;
    obj.selectedIndex = 0;
    obj.disabled = true;

    self.location.href = txt_pagina;

    obj.disabled = false;
}

function ValidarExtensaoArquivo(arquivo)
{
    if (arquivo) {
        var extensao;
        extensao = (arquivo.substring(arquivo.lastIndexOf("."))).toLowerCase();
        if (extensao != '.pdf')
        {            
            return false;
        }
        else
        {
            return true;
        }
    }
    else
    {
        return true;
    } 
}