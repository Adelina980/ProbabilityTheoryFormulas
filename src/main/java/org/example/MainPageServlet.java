package org.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/calculate")
public class MainPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        getServletContext().getRequestDispatcher("/WEB-INF/views/mainPage1.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        Map<String, String> errors = new HashMap<>();
        double formula;
        String operation =request.getParameter("operation");

        switch (operation) {
            case "permutations_without_repetitions":
                //Обработка размещений без повторений
                String numberN1 = request.getParameter("number_n1");
                String numberK1 = request.getParameter("number_k1");
                int n1 = Integer.parseInt(numberN1);
                int k1 = Integer.parseInt(numberK1);
                if (n1 >= 0 && k1 >= 0) {
                    if (n1 >= k1) {
                        formula = (double) getFactorial(n1) / getFactorial(n1 - k1);
                        request.setAttribute("formula", formula);
                        response.sendRedirect(request.getContextPath() + "/calculate");
                    } else {
                        errors.put("n>k", "n должен быть больше или равен k");
                    }
                } else {
                    errors.put("positive", "числа должны быть положительными");
                }

                break;
            case "permutations_with_repetitions":
                //Обработка размещений с повторениями
                String numberN2 = request.getParameter("number_n2");
                String numberK2 = request.getParameter("number_k2");
                int n2 = Integer.parseInt(numberN2);
                int k2 = Integer.parseInt(numberK2);
                if (n2 >= 0 && k2 >= 0) {
                    formula = (double) Math.pow(n2, k2);
                    request.setAttribute("formula", formula);
                    response.sendRedirect(request.getContextPath() + "/calculate");
                } else {
                    errors.put("positive", "числа должны быть положительными");
                }

                break;
            case "arrangements_without_repetitions":
                //Обработка перестановок без повторений
                String numberN3 = request.getParameter("number_n3");
                int n3 = Integer.parseInt(numberN3);
                if (n3 >= 0) {
                    formula = (double) getFactorial(n3);
                    request.setAttribute("formula", formula);
                    response.sendRedirect(request.getContextPath() + "/calculate");
                } else {
                    errors.put("positive", "числа должны быть положительными");
                }
                break;
            case "arrangements_with_repetitions":
                // Обработка перестановок с повторениями
                String numberK4 = request.getParameter("number_k4");
                int k4 = Integer.parseInt(numberK4);
                List<Integer> m = new ArrayList<>();
                for (int i = 0; i < k4; i++) {
                    String numberM = request.getParameter("number_m" + i);
                    if (Integer.parseInt(numberM) >= 0) {
                        m.add(Integer.parseInt(numberM));
                    } else {
                        errors.put("positive", "числа должны быть положительными");
                    }
                }
                formula = getFactorial(sum(m)) / factorialMultiplication(m);
                request.setAttribute("formula", formula);
                response.sendRedirect(request.getContextPath() + "/calculate");
                break;
            case "combinations_without_repetitions":
                // Обработка сочетаний без повторений
                String numberN5 = request.getParameter("number_n5");
                String numberK5 = request.getParameter("number_k5");
                int n5 = Integer.parseInt(numberN5);
                int k5 = Integer.parseInt(numberK5);
                if (n5 >= 0 && k5 >= 0) {
                    if (n5 >= k5) {
                        formula = combinationsWithoutRepetitions(n5, k5);
                        request.setAttribute("formula", formula);
                        response.sendRedirect(request.getContextPath() + "/calculate");
                    } else {
                        errors.put("n>k", "n должен быть больше или равен k");
                    }
                } else {
                    errors.put("positive", "числа должны быть положительными");
                }

                break;
            case "combinations_with_repetitions":
                // Обработка сочетаний с повторениями
                String numberN6 = request.getParameter("number_n6");
                String numberK6 = request.getParameter("number_k6");
                int n6 = Integer.parseInt(numberN6);
                int k6 = Integer.parseInt(numberK6);
                if (n6 >= 0 && k6 >= 0) {
                    formula = getFactorial(n6 + k6 - 1) / (getFactorial(n6 + k6 - 1 - k6) * getFactorial(k6));
                    request.setAttribute("formula", formula);
                    response.sendRedirect(request.getContextPath() + "/calculate");
                } else {
                    errors.put("positive", "числа должны быть положительными");
                }
                break;
            case "urn_model_all_marked_items":
                // Обработка урновой модели, извлечение всех меченных предметов
                String numberN7 = request.getParameter("number_n7");
                String numberM7 = request.getParameter("number_m7");
                String numberK7 = request.getParameter("number_k7");
                int n7 = Integer.parseInt(numberN7);
                int m7 = Integer.parseInt(numberM7);
                int k7 = Integer.parseInt(numberK7);
                if (n7 >= 0 && m7 >= 0 && k7 >= 0) {
                    if (m7>=k7 && n7>=k7){
                        formula = combinationsWithoutRepetitions(m7, k7) / combinationsWithoutRepetitions(n7, k7);
                        request.setAttribute("formula", formula);
                        response.sendRedirect(request.getContextPath() + "/calculate");
                    }else{
                        errors.put("n>k", "n должен быть больше или равен k");
                    }
                }else{
                    errors.put("positive", "числа должны быть положительными");
                }
                break;
            case "urn_model_r_marked_items":
                // Обработка урновой модели, извлечение r меченных предметов
                String numberN8 = request.getParameter("number_n8");
                String numberM8 = request.getParameter("number_m8");
                String numberK8 = request.getParameter("number_k8");
                String numberR8 = request.getParameter("number_r8");
                int n8 = Integer.parseInt(numberN8);
                int m8 = Integer.parseInt(numberM8);
                int k8 = Integer.parseInt(numberK8);
                int r8 = Integer.parseInt(numberR8);
                if (n8 >= 0 && m8 >= 0 && k8 >= 0 && r8>=0) {
                    if (m8>=r8 && (n8-m8)>=(k8-r8) && n8>=k8){
                        formula = (combinationsWithoutRepetitions(m8, r8)*combinationsWithoutRepetitions(n8-m8,k8-r8))/combinationsWithoutRepetitions(n8,k8);
                        request.setAttribute("formula", formula);
                        response.sendRedirect(request.getContextPath() + "/calculate");
                    }else{
                        errors.put("n>k", "n должен быть больше или равен k");
                    }
                }else{
                    errors.put("positive", "числа должны быть положительными");
                }
                break;
        }

    }

    public static int getFactorial(int f) {
        if (f <= 1) {
            return 1;
        } else {
            return f * getFactorial(f - 1);
        }
    }

    public static int sum(List<Integer> list) {
        int sum = 0;
        for (int i = 0; i < list.size(); i++) {
            sum += list.get(i);
        }
        return sum;
    }

    public static int factorialMultiplication(List<Integer> list) {
        int mult = 1;
        for (int i = 0; i < list.size(); i++) {
            mult *= getFactorial(list.get(i));
        }
        return mult;
    }

    public static double combinationsWithoutRepetitions(int n, int k) {
        double formula = getFactorial(n) / (getFactorial(k) * (getFactorial(n - k)));
        return formula;
    }

}
