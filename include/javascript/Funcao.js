function go(obj) {
    var txt_pagina = obj.value;
    obj.selectedIndex = 0;
    obj.disabled = true;

    self.location.href = txt_pagina;

    obj.disabled = false;
}