
let btnMinus = document.getElementById("minus");
let btnPlus = document.getElementById("plus");
let input = document.getElementById("TextBox1");

function btnM() {
    if (btnMinus.click()) {
        let x = parseInt(input.textContent);
        let s = x - 1;
        input.innerText = s;
    }
}