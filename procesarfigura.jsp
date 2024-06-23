<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Resultado Figura Geométrica</title>
    <link rel="stylesheet" type="text/css" href="resources/css/style.css">
</head>
<body>
    <h1>Resultado</h1>
    <%
        // Obtener los valores del formulario
        String val1Str = request.getParameter("valor1");
        String val2Str = request.getParameter("valor2");
        String val3Str = request.getParameter("valor3");
        String val4Str = request.getParameter("valor4");

        double[] valores = new double[4];
        int count = 0;

        if (val1Str != null && !val1Str.isEmpty()) valores[count++] = Double.parseDouble(val1Str);
        if (val2Str != null && !val2Str.isEmpty()) valores[count++] = Double.parseDouble(val2Str);
        if (val3Str != null && !val3Str.isEmpty()) valores[count++] = Double.parseDouble(val3Str);
        if (val4Str != null && !val4Str.isEmpty()) valores[count++] = Double.parseDouble(val4Str);

        if (count == 1) {
            // Es un Círculo
            double radio = valores[0];
            double diametro = 2 * radio;
            double circunferencia = 2 * Math.PI * radio;
            double area = Math.PI * Math.pow(radio, 2);

            out.println("<p>Figura: Círculo</p>");
            out.println("<p>Radio: " + radio + "</p>");
            out.println("<p>Diámetro: " + diametro + "</p>");
            out.println("<p>Circunferencia: " + circunferencia + "</p>");
            out.println("<p>Área: " + area + "</p>");
        } else if (count == 3) {
            // Es un Triángulo
            double a = valores[0];
            double b = valores[1];
            double c = valores[2];

            if (a == b && b == c) {
                out.println("<p>Figura: Triángulo Equilátero</p>");
            } else if (a == b || b == c || a == c) {
                out.println("<p>Figura: Triángulo Isósceles</p>");
            } else {
                out.println("<p>Figura: Triángulo Escaleno</p>");
            }

            // Calcular área usando la fórmula de Herón
            double s = (a + b + c) / 2;
            double area = Math.sqrt(s * (s - a) * (s - b) * (s - c));
            out.println("<p>Área: " + area + "</p>");
        } else if (count == 4) {
            if (valores[0] == valores[1] && valores[1] == valores[2] && valores[2] == valores[3]) {
                // Es un Cuadrado
                double lado = valores[0];
                double perimetro = 4 * lado;
                double area = Math.pow(lado, 2);

                out.println("<p>Figura: Cuadrado</p>");
                out.println("<p>Lado: " + lado + "</p>");
                out.println("<p>Perímetro: " + perimetro + "</p>");
                out.println("<p>Área: " + area + "</p>");
            } else {
                // Es un Rectángulo
                double lado1 = valores[0];
                double lado2 = valores[1];
                double perimetro = 2 * (lado1 + lado2);
                double area = lado1 * lado2;

                out.println("<p>Figura: Rectángulo</p>");
                out.println("<p>Lado 1: " + lado1 + "</p>");
                out.println("<p>Lado 2: " + lado2 + "</p>");
                out.println("<p>Perímetro: " + perimetro + "</p>");
                out.println("<p>Área: " + area + "</p>");
            }
        } else {
            out.println("<p>Error: Número de valores no válido</p>");
        }
    %>
</body>
</html>
