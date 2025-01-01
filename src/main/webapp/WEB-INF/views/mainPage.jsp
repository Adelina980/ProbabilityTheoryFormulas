<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Probability theory formulas</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style.css">
    <%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/mathjs/11.8.0/math.js"></script> <!-- Библиотека для математических вычислений -->--%>
    <%--    <script src="${pageContext.request.contextPath}/scripts/calculator.js"></script> </head>--%>
<body>
<div class="container">
    <form id="calculatorForm" method="post">
        <h1>Выберите формулу</h1>
        <select id="formulaSelect" name="operation">
            <option value="">Выберете формулу</option>
            <option value="permutations_without_repetitions">Размещения без повторений</option>
            <option value="permutations_with_repetitions">Размещения с повторениями</option>
            <option value="arrangements_without_repetitions">Перестановки без повторений</option>
            <option value="arrangements_with_repetitions">Перестановки с повторениями</option>
            <option value="combinations_without_repetitions">Сочетания без повторений</option>
            <option value="combinations_with_repetitions">Сочетания с повторениями</option>
            <option value="urn_model_all_marked_items">Урновая модель (все меченные)</option>
            <option value="urn_model_r_marked_items">Урновая модель (r меченных)</option>
        </select>

        <div id="formulaInputs"></div>

        <button type="button" onclick="calculate()">Рассчитать</button>
    </form>

    <div id="result" style="display: none"></div>
</div>


<script>

    const formulaSelect = document.getElementById('formulaSelect');


    const formulaInputs = document.getElementById('formulaInputs');

    function updateInputs() {
        formulaInputs.innerHTML = ''; // Очищаем предыдущие поля ввода
        const resultId = document.getElementById("result")
        resultId.textContent = "";
        resultId.style.display = "none";


        const selectedFormula = formulaSelect.value;
        switch (selectedFormula) {
            case 'permutations_without_repetitions':
                formulaInputs.innerHTML = `
        <p>Размещения без повторений:</p>
        <input type="hidden" name="operation" value="permutations_without_repetitions">
        <label for="n1">n:</label><input type="number" id="n1" name="number_n1" required min="0"><br>
        <label for="k1">k:</label><input type="number" id="k1" name="number_k1" required min="0">
      `;
                break;
            case 'permutations_with_repetitions':
                formulaInputs.innerHTML = `
        <p>Размещения с повторениями:</p>
        <label for="n2">n:</label><input type="number" id="n2" name="n2" required min="1"><br>
        <label for="k2">k:</label><input type="number" id="k2" name="k2" required min="1">
      `;
                break;
            case 'arrangements_without_repetitions':
                formulaInputs.innerHTML = `
        <p>Перестановки без повторений:</p>
            <input type="number" name="n3" id="n3" placeholder="введите число n" required min="0">
      `;
                break;
            case 'arrangements_with_repetitions':
                formulaInputs.innerHTML = `
          <p>Перестановки с повторениями:</p>
          <label for="k4">Количество различных элементов (n):</label>
          <input type="number" id="k4" name="distinctElements" required min="2"><br>
          <div id="repetitionsContainer"></div>
        `;
                addRepetitionsInputs(); //Функция для динамического добавления input
                break;
            case 'combinations_without_repetitions':
                formulaInputs.innerHTML = `
        <p>Сочетания без повторений:</p>
        <input type="number" name="n5" id="n5" placeholder="введите число n" required>
        <input type="number" name="k5" id="k5" placeholder="введите число k" required>`
                break;
            case 'combinations_with_repetitions':
                formulaInputs.innerHTML = `
        <p>Сочетания с повторениями:</p>
        <input type="number" name="n6" id="n6" placeholder="введите число n" required>
        <input type="number" name="k6" id="k6" placeholder="введите число k" required>`
                break;
            case 'urn_model_all_marked_items':
                formulaInputs.innerHTML = `
        <p>Урновая модель, в которой извлекаются все меченные предметы:</p>
        <input type="number" name="n7" id="n7" placeholder="введите число n" required>
        <input type="number" name="m7" id="m7" placeholder="введите число m" required>
        <input type="number" name="k7" id="k7" placeholder="введите число k" required>`
                break;
            case 'urn_model_r_marked_items':
                formulaInputs.innerHTML = `
        <p>Урновая модель, в которой извлекаются r меченных предметов:</p>
        <input type="number" name="n8" id="n8" placeholder="введите число n" required>
        <input type="number" name="m8" id="m8" placeholder="введите число m" required>
        <input type="number" name="k8" id="k8" placeholder="введите число k" required>
        <input type="number" name="r8" id="r8" placeholder="введите число r" required>`
                break;
            default:
                formulaInputs.innerHTML = '<p>Выберите формулу</p>';
        }
    }

    function addRepetitionsInputs() {
        const numElements = document.getElementById("k4").value;
        const container = document.getElementById("repetitionsContainer");
        const distinctElements = document.getElementById("k4");
        distinctElements.addEventListener('change', addRepetitionsInputs)
        container.innerHTML = '';
        for (let i = 1; i <= numElements; i++) {
            const label = document.createElement("label");
            label.htmlFor = `repetitionsCount` + i;
            label.textContent = `Количество повторений элемента ` + i + ` :`;
            const input = document.createElement("input");
            input.type = "number";
            input.id = "m" + i;
            input.name = `repetitionsCount` + i;
            input.required = true;
            input.min = 0;
            container.appendChild(label);
            container.appendChild(input);
            container.appendChild(document.createElement('br'));
        }
    }


    formulaSelect.addEventListener('change', updateInputs);

    function combinationsWithoutRepetitionsFormula(n, k) {
        const formula = getFactorial(n) / (getFactorial(k) * (getFactorial(n - k)));
        return formula;
    }

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
        if (n < k || n < 0 || k < 0) {
            alert("Некорректные входные данные.");
            document.getElementById("result").textContent = "";
            return;
        }
        return getFactorial(n) / getFactorial(n - k);
    }

    function permutationsWithRepetitions(n, k) {
        if (n < 0 || k < 0) {
            alert("Числа должны быть положительными.");
            document.getElementById("result").textContent = "";
            return;
        }
        return Math.pow(n, k);
    }

    function arrangementsWithoutRepetitions(n) {
        if (n < 0) {
            alert("Числа должны быть положительными.");
            document.getElementById("result").textContent = "";
            return;

        }
        return getFactorial(n);
    }

    function arrangementsWithRepetitions(k, m) {
        if (k <= 1) {
            alert("Введите число большее 1.");
            document.getElementById("result").textContent = "";
            return;
        }
        for (let i = 0; i < m.length; i++) {
            if (m[i] < 0) {
                alert("Числа должны быть положительными.");
                document.getElementById("result").textContent = "";
                return;
            }
        }
        return getFactorial(sum(m)) / factorialMultiplication(m);
    }

    function combinationsWithoutRepetitions(n, k) {
        if (n < 0 || k < 0 || n < k) {
            alert("Некорректные входные данные.");
            document.getElementById("result").textContent = "";
            return;
        }
        return getFactorial(n) / (getFactorial(k) * getFactorial(n - k));
    }

    function combinationsWithRepetitions(n, k) {
        if (n <= 0 || k < 0) {
            alert("Некорректные входные данные.");
            document.getElementById("result").textContent = "";
            return;
        }
        return getFactorial(n + k - 1) / (getFactorial(k) * getFactorial(n - 1));
    }

    function urnModelAllMarkedItems(n, m, k) {
        if (n < 0 || m < 0 || k < 0 || n < k || m > k) {
            alert("Некорректные входные данные.");
            document.getElementById("result").textContent = "";
            return;
        }
        return combinationsWithoutRepetitionsFormula(m, k) / combinationsWithoutRepetitionsFormula(n, k);
    }

    function urnModelRMarkedItems(n, m, k, r) {
        if (n < 0 || m < 0 || k < 0 || r < 0 || n < k || m > r || m > k || r < k) {
            alert("Некорректные входные данные.");
            document.getElementById("result").textContent = "";
            return;
        }

        return (combinationsWithoutRepetitionsFormula(m, r) * combinationsWithoutRepetitionsFormula(n - m, k - r)) / combinationsWithoutRepetitionsFormula(n, k);
    }

    function calculate() {
        let result;
        const formulaSelect = document.getElementById('formulaSelect');
        if (formulaSelect === null) {
            console.error("Элемент 'formulaSelect' не найден!");
        }
        const operation = formulaSelect.value;

        const form = document.getElementById("calculatorForm");
        if (!form.checkValidity()) {  // Проверка встроенной валидации браузера
            form.reportValidity();   // Подсвечиваем незаполненные поля
            return;
        }

        switch (operation) {
            case 'permutations_without_repetitions':
                let n1 = parseInt(document.getElementById("n1").value);
                let k1 = parseInt(document.getElementById("k1").value);
                result = permutationsWithoutRepetitions(n1, k1);
                break;
            case 'permutations_with_repetitions':
                let n2 = parseInt(document.getElementById("n2").value);
                let k2 = parseInt(document.getElementById("k2").value);
                result = permutationsWithRepetitions(n2, k2);
                break;
            case 'arrangements_without_repetitions':
                let n3 = parseInt(document.getElementById("n3").value);
                result = arrangementsWithoutRepetitions(n3);
                break;
            case 'arrangements_with_repetitions':
                let k4 = parseInt(document.getElementById("k4").value);
                let m = [];
                for (let i = 1; i <= k4; i++) {
                    m.push(parseInt(document.getElementById("m" + i).value));
                }
                result = arrangementsWithRepetitions(k4, m);
                break;
            case 'combinations_without_repetitions':
                let n5 = parseInt(document.getElementById("n5").value);
                let k5 = parseInt(document.getElementById("k5").value);
                result = combinationsWithoutRepetitions(n5, k5);
                break;
            case 'combinations_with_repetitions':
                let n6 = parseInt(document.getElementById("n6").value);
                let k6 = parseInt(document.getElementById("k6").value);
                result = combinationsWithRepetitions(n6, k6);
                break;
            case 'urn_model_all_marked_items':
                let n7 = parseInt(document.getElementById("n7").value);
                let m7 = parseInt(document.getElementById("m7").value);
                let k7 = parseInt(document.getElementById("k7").value);
                result = urnModelAllMarkedItems(n7, m7, k7);
                break;
            case 'urn_model_r_marked_items':
                let n8 = parseInt(document.getElementById("n8").value);
                let m8 = parseInt(document.getElementById("m8").value);
                let k8 = parseInt(document.getElementById("k8").value);
                let r8 = parseInt(document.getElementById("r8").value);
                result = urnModelRMarkedItems(n8, m8, k8, r8);
                break;
            default:
                alert("Неверный тип операции.");
                return;
        }
        if (typeof result === "undefined") {
            document.getElementById("result").textContent = "";
            return;
        }
        const resultId = document.getElementById("result");
        resultId.textContent = "Результат: " + result;
        resultId.style.display = "block";
    }

    updateInputs();
</script>

</body>
</html>
