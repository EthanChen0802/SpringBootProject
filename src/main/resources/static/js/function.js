




function Onblur(el,sp){
  	
  	let Val=el.value;                  
     if (Val == ""){
        sp.innerHTML="<img src='images/incorrect.jpg'>不可空白";
     	return false;
     }else{
     	sp.innerHTML="";
     	return true;
     }
}

function checkckbox(el,sp){
  
    let Val=false;
    el.forEach((cb) => {
    	if (cb.checked){
    	Val=true;    	
    	}
    });              
     if (!Val){
        sp.innerHTML="<img src='images/incorrect.jpg'>請至少勾選一個";
     	return false;
     }else{
     	sp.innerHTML="";
     	return true;
     }
}

function checkradio(el,sp){
   
   	let Val=false;
    el.forEach((cb) => {
    	if (cb.checked){
    	Val=true;
    	
    	}
    });                      
     if (!Val){
        sp.innerHTML="<img src='images/incorrect.jpg'>請勾選一個";
     	return false;
     }else{
     	sp.innerHTML="";
     	return true;
     }
}

function checksel(el,sp){

	let Val=el.value;	
	if (Val<1){
		sp.innerHTML="<img src='images/incorrect.jpg'>請選擇";
     	return false;
     }else{
     	sp.innerHTML="";
     	return true;
     }
}

function phoneCheck(el,sp){
	let elv = el.value;
	let val=elv.replace(/[^0-9]/g,"");
		
	if (/^0800[\d]{6}$/.test(val)){
		el.value=val.slice(0,4)+"-"+val.slice(4);
		sp.innerHTML="";
     	return true;
	}else if (/^09[\d]{8}$/.test(val)){
		el.value=val.slice(0,4)+"-"+val.slice(4);
		sp.innerHTML="";
     	return true;
	}else if (/^02[\d]{8}$/.test(val)){
		el.value=val.slice(0,2)+"-"+val.slice(2);
		sp.innerHTML="";
     	return true;
	}else if (/^0[\d]{8}$/.test(val)){
		el.value=val.slice(0,2)+"-"+val.slice(2);
		sp.innerHTML="";
     	return true;
	}else{
		sp.innerHTML="<img src='images/incorrect.jpg'>格式錯誤";
     	return false;
	}
}

function addressCheck(el,sp){
	
	let val=el.value;
	let valLen=val.length
	if (valLen<5){
		sp.innerHTML="<img src='images/incorrect.jpg'>格式錯誤";
     	return false;
	}else{
		for(let i=0; i < valLen; i++){
        	let ch = val.charCodeAt(i);
			if (ch < 0x4e00 || ch > 0x9fff) {
        	sp.innerHTML = "<img src='images/incorrect.jpg'>必須為中文";
        	return false;
        	}else{
     		sp.innerHTML="";
     		return true;
     		}	
     	}
	}
}





     
