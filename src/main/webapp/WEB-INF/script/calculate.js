function getFactorial(n) {
    if (n < 0) {
        alert("Факториал отрицательного числа не определен.");
        return 1; // Или вы можете вернуть другое значение по умолчанию
    }
    if (n == 0 || n == 1) {
        return 1;
    }
    let result = 1;
    for (let i = 2; i <= n; i++) {
        result *= i;
    }
    return result;
}

function factorialMultiplication(list) {
    let result = 1;
    for (let i = 0; i < list.length; i++) {
        result *= getFactorial(list[i]);
    }
    return result;
}

function sum(list) {
    let result = 0;
    for (let i = 0; i < list.length; i++) {
        result += list[i];
    }
    return result;
}

function permutationsWithoutRepetitions(n, k) {
    if (n < 0 || k < 0 || n < k) {
        alert("Некорректные входные данные.");
        return 0;
    }
    return getFactorial(n) / getFactorial(n - k);
}

function permutationsWithRepetitions(n, k) {
    if (n < 0 || k < 0) {
        alert("Числа должны быть положительными.");
        return 0;
    }
    return Math.pow(n, k);
}

function arrangementsWithoutRepetitions(n) {
    if (n < 0) {
        alert("Числа должны быть положительными.");
        return 0; // Или вы можете вернуть другое значение по умолчанию
    }
    return getFactorial(n);
}

function arrangementsWithRepetitions(k, m) {
    if (k < 0) {
        alert("Числа должны быть положительными.");
        return 0; // Или вы можете вернуть другое значение по умолчанию
    }
    return getFactorial(sum(m)) / factorialMultiplication(m);
}

function combinationsWithoutRepetitions(n, k) {
    if (n < 0 || k < 0 || n < k) {
        alert("Некорректные входные данные.");
        return 0; // Или вы можете вернуть другое значение по умолчанию
    }
    return getFactorial(n) / (getFactorial(k) * getFactorial(n - k));
}

function combinationsWithRepetitions(n, k) {
    if (n < 0 || k < 0) {
        alert("Некорректные входные данные.");
        return 0; // Или вы можете вернуть другое значение по умолчанию
    }
    return getFactorial(n + k - 1) / (getFactorial(k) * getFactorial(n - 1));
}

function urnModelAllMarkedItems(n, m, k) {
    if (n < 0 || m < 0 || k < 0 || n < k || m < k) {
        alert("Некорректные входные данные.");
        return 0; // Или вы можете вернуть другое значение по умолчанию
    }
    return getFactorial(n) / (getFactorial(k) * getFactorial(n - k));
}

function urnModelRMarkedItems(n, m, k, r) {
    if (n < 0 || m < 0 || k < 0 || r < 0 || n < k || m < r) {
        alert("Некорректные входные данные.");
        return 0; // Или вы можете вернуть другое значение по умолчанию
    }
    return (combinationsWithoutRepetitions(m, r) * combinationsWithoutRepetitions(n - m, k - r)) / combinationsWithoutRepetitions(n, k);
}

function calculate(operation) {
    let result;
    switch (operation) {
        case 'permutations_without_repetitions':
            let n1 = parseInt(document.getElementById("number_n1").value);
            let k1 = parseInt(document.getElementById("number_k1").value);
            result = permutationsWithoutRepetitions(n1, k1);
            break;
        case 'permutations_with_repetitions':
            let n2 = parseInt(document.getElementById("number_n2").value);
            let k2 = parseInt(document.getElementById("number_k2").value);
            result = permutationsWithRepetitions(n2, k2);
            break;
        case 'arrangements_without_repetitions':
            let n3 = parseInt(document.getElementById("number_n3").value);
            result = arrangementsWithoutRepetitions(n3);
            break;
        case 'arrangements_with_repetitions':
            let k4 = parseInt(document.getElementById("number_k4").value);
            let m = [];
            for (let i = 0; i < k4; i++) {
                m.push(parseInt(document.getElementById("number_m" + i).value));
            }
            result = arrangementsWithRepetitions(k4, m);
            break;
        case 'combinations_without_repetitions':
            let n5 = parseInt(document.getElementById("number_n5").value);
            let k5 = parseInt(document.getElementById("number_k5").value);
            result = combinationsWithoutRepetitions(n5, k5);
            break;
        case 'combinations_with_repetitions':
            let n6 = parseInt(document.getElementById("number_n6").value);
            let k6 = parseInt(document.getElementById("number_k6").value);
            result = combinationsWithRepetitions(n6, k6);
            break;
        case 'urn_model_all_marked_items':
            let n7 = parseInt(document.getElementById("number_n7").value);
            let m7 = parseInt(document.getElementById("number_m7").value);
            let k7 = parseInt(document.getElementById("number_k7").value);
            result = urnModelAllMarkedItems(n7, m7, k7);
            break;
        case 'urn_model_r_marked_items':
            let n8 = parseInt(document.getElementById("number_n8").value);
            let m8 = parseInt(document.getElementById("number_m8").value);
            let k8 = parseInt(document.getElementById("number_k8").value);
            let r8 = parseInt(document.getElementById("number_r8").value);
            result = urnModelRMarkedItems(n8, m8, k8, r8);
            break;
        default:
            alert("Неверный тип операции.");
            return;
    }
    document.getElementById("result").innerHTML = "Результат: " + result;
}

