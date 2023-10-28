window.addEventListener('turbo:load', () => {
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1 );
  const addProfitDom = document.getElementById("profit");
  addProfitDom.innerHTML = Math.round(priceInput.value - Math.floor(priceInput.value * 0.1 ))
});
