// const InitOrderPrice = () => {
//   const total = document.getElementById('total');
//   if(total){
//     const quantity = document.querySelector('.select2')
//     total.innerText = total.dataset.price * quantity.value;
//     if (quantity) {
//         quantity.addEventListener('change', () => {
//         console.log(quantity.value)
//         total.innerText = total.dataset.price * quantity.value;
//       });
//     }
//   }

// };


// export {InitOrderPrice}

const InitOrderPrice = () => {
  const quantity = document.getElementById('order_quantity');
  if (quantity){
        quantity.addEventListener('change', () => {
      const total = document.getElementById('total');
      total.innerText = total.dataset.price * quantity.value;
    });
  }
};


export {InitOrderPrice}



