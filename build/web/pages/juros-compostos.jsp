<%-- 
    Document   : juros-compostos
    Created on : 18 de set. de 2023, 14:47:42
    Author     : victa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.lang.Math" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Juros compostos Page</title>
    </head>
    <body>
        <%@include file="../WEB-INF/jspf/menu.jspf" %>
        <h2>Page juros compostos</h2>
        <form action="juros-compostos.jsp">
            <input type="number" placeholder="valor investido" name="valor">
            <input type="number" placeholder="taxa fixa(%)" name="taxa">
            <input type="number" placeholder="tempo(meses)"name="qtMeses">
            <input type="submit" value="Calcular">
        </form>
        <%
            String errorMessage = null;
            int qtMeses = 0;
            double valor = 0;
            double taxa = 0;
            double montante = 0;
            try {
                valor = Double.parseDouble(request.getParameter("valor"));
                taxa = Double.parseDouble(request.getParameter("taxa"));
                qtMeses = Integer.parseInt(request.getParameter("qtMeses"));
            } catch (Exception e) {
                errorMessage = e.getMessage();
        }%>
        
        <table border="1">
            <tr>
                <%for(int i = 0; i <= qtMeses; i++){ %>
                <%if(i == 0){%>
                    <th>Qt de meses</th>
                <%}%>
                <th><%=i%></th>
                <%}%>
            </tr>
            <tr>
                <%for(int i = 0; i <= qtMeses; i++){ %>
                <%if(i == 0){%>
                    <th>Valor Montante</th>
                <%}%>
                <%montante = (valor * Math.pow((1 + (taxa/100)), i));%>
                <td><%=montante%></td>
                <%}%>
                
            </tr>
        </table>
    </body>
</html>
