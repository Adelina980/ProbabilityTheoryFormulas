// const formulaSelect = document.getElementById('formulaSelect');
// const formulaInputs = document.getElementById('formulaInputs');
//
// function updateInputs() {
//     formulaInputs.innerHTML = ''; // Очищаем предыдущие поля ввода
//
//     const selectedFormula = formulaSelect.value;
//     switch (selectedFormula) {
//         case 'permutations_without_repetitions':
//             formulaInputs.innerHTML = `
//         <p>Размещения без повторений:</p>
//         <label for="n1">n:</label><input type="number" id="n1" name="n1" required><br>
//         <label for="k1">k:</label><input type="number" id="k1" name="k1" required>
//       `;
//             break;
//         case 'permutations_with_repetitions':
//             formulaInputs.innerHTML = `
//         <p>Размещения с повторениями:</p>
//         <label for="n2">n:</label><input type="number" id="n2" name="n2" required><br>
//         <label for="k2">k:</label><input type="number" id="k2" name="k2" required>
//       `;
//             break;
//         // ... добавить другие формулы ...
//         case 'arrangements_with_repetitions':
//             formulaInputs.innerHTML = `
//           <p>Перестановки с повторениями:</p>
//           <label for="distinctElements">Количество различных элементов (n):</label>
//           <input type="number" id="distinctElements" name="distinctElements" required><br>
//           <div id="repetitionsContainer"></div>
//         `;
//             addRepetitionsInputs(); //Функция для динамического добавления input
//             break;
//
//         // ... другие формулы
//         default:
//             formulaInputs.innerHTML = '<p>Выберите формулу</p>';
//     }
// }
//
// function addRepetitionsInputs() {
//     const numElements = document.getElementById("distinctElements").value;
//     const container = document.getElementById("repetitionsContainer");
//     container.innerHTML = '';
//     for (let i = 0; i < numElements; i++) {
//         const label = document.createElement("label");
//         label.htmlFor = `repetitionsCount${i}`;
//         label.textContent = `Количество повторений элемента ${i + 1}:`;
//         const input = document.createElement("input");
//         input.type = "number";
//         input.id = `repetitionsCount${i}`;
//         input.name = `repetitionsCount${i}`;
//         input.required = true;
//         container.appendChild(label);
//         container.appendChild(input);
//         container.appendChild(document.createElement('br'));
//     }
// }
//
// document.getElementById("distinctElements").addEventListener('change', addRepetitionsInputs);
//
//
// formulaSelect.addEventListener('change', updateInputs);
// updateInputs(); // Вызываем при загрузке страницы

