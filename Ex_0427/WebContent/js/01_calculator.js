function calculate(operator) {
	let num01 = Number(document.getElementById(`first_num`).value);
	let num02 = Number(document.getElementById(`second_num`).value);
	let res;
	if (operator == `add`) {
		res = num01 + num02;
	} else if (operator == `subtract`) {
		res = num01 - num02;
	} else if (operator == `multiply`) {
		res = num01 * num02;
	} else if (operator == `divide`) {
		res = num01 / num02;
	}
	let result = document.getElementById(`result`);
	result.innerHTML = res;
}