const InitOrderPrice = () => {
  const total = document.getElementById('total');
  if(total){
    const quantity = document.querySelector('.select2')
    total.innerText = total.dataset.price * quantity.value;
    if (quantity) {
        quantity.addEventListener('change', () => {
        console.log(quantity.value)
        total.innerText = total.dataset.price * quantity.value;
      });
    }
  }

};


export {InitOrderPrice}

