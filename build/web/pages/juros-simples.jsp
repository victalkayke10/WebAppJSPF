<%-- 
    Document   : juros-simples
    Created on : 18 de set. de 2023, 14:47:28
    Author     : victa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Juros simples Page</title>
    </head>
    <body>
        <%@include file="../WEB-INF/jspf/menu.jspf" %>
        <h2>Page juros simples</h2>
        <form action="juros-simples.jsp">
            <input type="number" placeholder="valor" name="valor">
            <input type="number" placeholder="taxa(%)" name="taxa">
            <input type="number" placeholder="tempo(meses)"name="qtMeses">
            <input type="submit" value="Calcular">
        </form>
        <%
            String errorMessage = null;
            int qtMeses = 0;
            double valor = 0;
            double taxa = 0;
            try {
                valor = Double.parseDouble(request.getParameter("valor"));
                taxa = Double.parseDouble(request.getParameter("taxa"));
                qtMeses = Integer.parseInt(request.getParameter("qtMeses"));
            } catch (Exception e) {
                errorMessage = e.getMessage();
        }%>
            
        <%
            double totalJuros = (valor * ((taxa/100) * qtMeses));
        %>
        <p>Total de juros calculados: <%=totalJuros%> <br></p>
        <p>Total do montante: <%=totalJuros + valor%></p>
    </body>
</html>
