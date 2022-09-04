const form = document.querySelector('.buy-form');
const numCard = document.querySelector('#num-card');
const cvv = document.querySelector('#cvv');




form.addEventListener('submit', (e)=>{
    if(numCard.value.length <16 || numCard.value.length>16){
        e.preventDefault();
        alert('El numero de la targeta no puede ser mayor o menor de 16');
        numCard.setAttribute("style","border-color:red")
    }else{
        numCard.removeAttribute("style")
    }
    if(cvv.value.length <3 || cvv.value.length>3){
        e.preventDefault();
        alert('El numero de cvv no puede ser mayor o menor de 3');
        cvv.setAttribute("style","border-color:red")
    }else{
        cvv.removeAttribute("style")
    }
  
});