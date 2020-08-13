const InitOrderPrice = () => {
  const quantity = document.getElementById('order_quantity');
    quantity.addEventListener('change', () => {
      const total = document.getElementById('total');
      total.innerText = total.dataset.price * quantity.value;
    });

};


export {InitOrderPrice}

