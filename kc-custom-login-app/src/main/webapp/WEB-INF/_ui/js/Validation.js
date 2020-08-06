function showFormData(oForm) {

	// var msg = "The data that you entered for the form with 'name'
	// attribute='" + oForm.name + "': \n";
	var msg = "";
	var y="";
	for ( var i = 1; i < oForm.length,
			oForm.elements[i].getAttribute("type") !== 'btnSave',
			oForm.elements[i].getAttribute("type") !== 'btnReset'; i++) {

		if (oForm.elements[i].getAttribute("id") !== 'NotRequired') {
			// msg += oForm.elements[i].tagName + " with 'name' attribute='" +
			// oForm.elements[i].id + "' and data: ";
			if (oForm.elements[i].value == null
					|| oForm.elements[i].value == ''
					|| oForm.elements[i].selectedIndex == 0) {
				msg += oForm.elements[i].id + " " + "is Required \n";

				alert(msg);
				msg = "";
				return false;

			}
		}

		if (oForm.elements[i].getAttribute("title") == 'numeric')

			var y = oForm.elements[i].value;

		{
			
			
			if (isNaN(y)==true) {
				
				msg += oForm.elements[i].id + " " + "must be a number(0-9) \n";
				var h = (y.length);
				alert(msg);
				msg = "";
				return false;
			/*	for(var z =0 ; z<h; z++)
				
				{  	//alert(oForm.elements[i].value[z]);
				if(oForm.elements[i].value[z] == '-')
					{
					alert("beepbeepbeep");
//					return true;				

					}
				else if(z==h){
					alert(msg);
					msg = "";
					return false;
					
				}*/
				}
			//	alert(y.length);
				
			}

		}
	}

