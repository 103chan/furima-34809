window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  if (!priceInput){ return false;}
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
     const addTaxDom = document.getElementById("add-tax-price");
     addTaxDom.innerHTML = (Math.floor(inputValue / 10));
     const salesProfit = document.getElementById("profit");
     salesProfit.innerHTML = (Math.floor(inputValue - (inputValue / 10)));
  })
})
