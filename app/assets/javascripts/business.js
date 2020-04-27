
function CalculePreview(price, maxQuotes) {
  let quantity = document.getElementById("buy_quantity").value;
  if(quantity > maxQuotes) {
    document.getElementById("buy_quantity").value = maxQuotes;
    quantity = maxQuotes;
  }

  let total = quantity * price;
  document.getElementById("total-price").innerHTML = `$${total.toFixed(2)}`;
}
