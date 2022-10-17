<%-- 
    Document   : index
    Created on : 16 oct. de 2022, 19:18:07
    Author     : RONALD ALEJO MAMANI
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.Producto"%>
<%
    if (session.getAttribute("almacen") == null) {
            ArrayList<Producto> lisaux = new ArrayList<Producto>();
            session.setAttribute("almacen", lisaux);
        }
        ArrayList<Producto> almacen = (ArrayList<Producto>)session.getAttribute("almacen");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>CARRITO DE COMPRAS</h1>
        <form action="MainServlet" method="post">
            <table>
                <tr>
                    <td>Id</td>
                    <td><input type="test" name="id" value="0" size="2"  ></td>
                </tr>
                <tr>
                    <td>PRODUCTO</td>
                    <td><input type="text" name="producto" value="" ></td>
                </tr>
                <tr>
                    <td>CANTIDAD</td>
                    <td><input type="text" name="cantidad" value="0" ></td>
                </tr>
                <tr>
                    <td>PRECIO</td>
                    <<td><input type="text" name="precio" value="0" ></td>>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="PROCESAR" ></td>
                </tr>
            </table>
        </form>
        <a href="MainServlet?OP=vaciar">VACIAR CARRITO</a>
        <h2>CONTENIDO DEL CARRITO</h2>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>PRODUCTOS</th>
                <th>CANTIDAD</th>
                <th>PRECIO</th>
                <th></th>
            </tr>
            <%
                if (almacen != null) {
                        for (Producto p : almacen) {
            %>
            <tr>
                <td><%= p.getId() %></td>
                <td><%= p.getProducto() %></td>
                <td><%= p.getCantidad() %></td>
                <td><%= p.getPrecio() %></td>
                <td><a href="MainServlet?op=eliminar&id=<%= p.getId() %>">X</a></td>
            </tr>
            <%
                    }
                }    
            %>
        </table>
    </body>
</html>
