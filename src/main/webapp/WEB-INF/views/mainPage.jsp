<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ru">
<head>
  <meta charset="UTF-8">
  <title>Probability theory formulas</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/normalize.8.0.1.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/reset.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/styles.css">

</head>
<body>
<form action="/calculate" method="post">
  <h1>Выберите формулу</h1>
  <button class="permutations_without_repetitions-btn btn">Размещения без повторений</button>
  <button class="permutations_with_repetitions-btn btn">Размещения с повторениями</button>
  <button class="arrangements_without_repetitions-btn btn">Перестановки без повторений</button>
  <button class="arrangements_with_repetitions-btn btn">Перестановки с повторениями</button>
  <button class="combinations_without_repetitions-btn btn">Сочетания без повторений</button>
  <button class="combinations_with_repetitions-btn btn">Сочетания с повторениями</button>
  <button class="urn_model_all_marked_items-btn btn">Урновая модель, в которой извлекаются все меченные предметы</button>
  <button class="urn_model_r_marked_items-btn btn">Урновая модель, в которой извлекаются r меченных предметов</button>
</form>

<form action="/calculate" method="post">
  <input type="hidden" name="operation" value="permutations_without_repetitions">
  <p>Размещения без повторений:
    <input type="number" name="number_n1" placeholder="введите число n" required>
    <input type="number" name="number_k1" placeholder="введите число k" required>
  </p>
  <button onclick="permutations_without_repetitions()" type="button" class="btn btn-secondary">Рассчитать</button>
<%--  <button type="submit">Рассчитать</button>--%>

  <c:if test="${not empty formula}">
    <p>Результат: ${formula}</p>
  </c:if>
</form>


<form action="/calculate" method="post">
  <input type="hidden" name="operation" value="permutations_with_repetitions">
  <p>Размещения с повторениями:
    <input type="number" name="number_n2" placeholder="введите число n" required>
    <input type="number" name="number_k2" placeholder="введите число k" required>
  </p>
  <button type="submit">Рассчитать</button>
  <c:if test="${not empty formula}">
    <p>Результат: ${formula}</p>
  </c:if>

</form>

<form action="/calculate" method="post">
  <input type="hidden" name="operation" value="arrangements_without_repetitions">
  <p>Перестановки без повторений:
    <input type="number" name="number_n3" placeholder="введите число n" required>
  </p>
  <button type="submit">Рассчитать</button>
  <c:if test="${not empty formula}">
    <p>Результат: ${formula}</p>
  </c:if>

</form>

<form action="/calculate" method="post">
  <input type="hidden" name="operation" value="arrangements_with_repetitions">
  <p>Перестановки с повторениями:</p>

  <label for="numberOfDistinctElements">Количество различных элементов (n):</label>
  <input type="number" id="numberOfDistinctElements" name="numberOfDistinctElements" required>
  <br>

  <c:set var="numberOfDistinctElements" value="${param.numberOfDistinctElements}" />

  <c:if test="${not empty numberOfDistinctElements}">
    <c:forEach var="i" begin="0" end="${numberOfDistinctElements - 1}">
      <label for="repetitionsCount${i}">Количество повторений элемента ${i + 1}:</label>
      <input type="number" id="repetitionsCount${i}" name="repetitionsCount${i}" placeholder="введите число n" required>
      <br>
    </c:forEach>
  </c:if>

  <button type="submit">Рассчитать</button>
  <c:if test="${not empty formula}">
    <p>Результат: ${formula}</p>
  </c:if>
</form>


<form action="/calculate" method="post">
  <input type="hidden" name="operation" value="combinations_without_repetitions">
  <p>Сочетания без повторений:
    <input type="number" name="number_n5" placeholder="введите число n" required>
    <input type="number" name="number_k5" placeholder="введите число k" required>
  </p>
  <button type="submit">Рассчитать</button>
  <c:if test="${not empty formula}">
    <p>Результат: ${formula}}</p>
  </c:if>

</form>

<form action="/calculate" method="post">
  <input type="hidden" name="operation" value="combinations_with_repetitions">
  <p>Сочетания с повторениями:
    <input type="number" name="number_n6" placeholder="введите число n" required>
    <input type="number" name="number_k6" placeholder="введите число k" required>
  </p>
  <button type="submit">Рассчитать</button>
  <c:if test="${not empty formula}">
    <p>Результат: ${formula}</p>
  </c:if>

</form>

<form action="/calculate" method="post">
  <input type="hidden" name="operation" value="urn_model_all_marked_items">
  <p>Урновая модель, в которой извлекаются все меченные предметы:
    <input type="number" name="number_n7" placeholder="введите число n" required>
    <input type="number" name="number_m7" placeholder="введите число m" required>
    <input type="number" name="number_k7" placeholder="введите число k" required>
  </p>
  <button type="submit">Рассчитать</button>
  <c:if test="${not empty formula}">
    <p>Результат: ${formula}</p>
  </c:if>

</form>

<form action="/calculate" method="post">
  <input type="hidden" name="operation" value="urn_model_r_marked_items">
  <p>Урновая модель, в которой извлекаются r меченных предметов:
    <input type="number" name="number_n8" placeholder="введите число n" required>
    <input type="number" name="number_m8" placeholder="введите число m" required>
    <input type="number" name="number_k8" placeholder="введите число k" required>
    <input type="number" name="number_r8" placeholder="введите число r" required>
  </p>
  <button type="submit">Рассчитать</button>
  <c:if test="${not empty formula}">
    <p>Результат: ${formula}</p>
  </c:if>

</form>
<script>

</script>

</body>
</html>
