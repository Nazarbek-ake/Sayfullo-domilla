<%@ page import="org.example.dbService.DbService" %>
<%@ page import="org.example.model.Result" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="org.example.model.Country" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 04/03/2023
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>salom</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
</head>

<%
    DbService dbService = new DbService();
    try {
        Result result = dbService.addCountry(request.getParameter("name"));
        if (result.isSuccess()){
            out.print(
                    "<h1 class=\"text-center text-success\">"+result.getMessage()+"</h1>"
            );
            System.out.println(result.getMessage());
        }else {
            System.err.println(result.getMessage());
        }
    } catch (ClassNotFoundException | SQLException e) {
        throw new RuntimeException(e);
    }
%>

<body>
    <div class="container">
        <div class="col">
            <h1 class="text-center text-success">salom backend 1</h1>
        </div>
        <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
            <i class="bi bi-plus-circle"></i>
        </button>
        <div class="col d-flex align-items-center justify-content-center">
            <div class="col-6">
                <table class="table text-center">
                    <thead>
                    <tr>
                        <th>T/r</th>
                        <th>name</th>
                        <th colspan="2" class="w-25">action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        try {
                            List<Country> country = dbService.getCountry();
                            for (int i = 0; i < country.size(); i++) {
                                out.print(
                                        " <tr>\n" +
                                                "<td>"+(i+1)+"</td>\n" +
                                                "<td>"+country.get(i).getName()+"</td>\n" +
                                                "<td><button class=\"btn btn-warning\"><i class=\"bi bi-pencil-square\"></i></button></td>\n" +
                                                "<td><button class=\"btn btn-danger\"><i class=\"bi bi-trash\"></i></button></td>\n" +
                                                "</tr>"
                                );
                            }
                        } catch (ClassNotFoundException | SQLException e) {
                            throw new RuntimeException(e);
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>



    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">add country</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="/country.jsp">
                        <label for="name"></label>
                        <input type="text" class="form-control" placeholder="enter name" id="name" name="name"><br>
                        <button type="submit" class="btn btn-primary">Save</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
