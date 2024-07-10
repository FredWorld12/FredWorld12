<%-- 
    Document   : LoggedInForm
    Created on : 17 Mar 2024, 10:23:53 PM
    Author     : Surf
--%>

<%@page import="java.util.List"%>
<%@page import="za.ac.tut.entities.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="RegisterServlet" method="POST">
            <div align="center">
                <h1>Employee Records</h1>   

                <%
                    List<Employee> empList = (List<Employee>) session.getAttribute("employeeList");
                    if (empList.size() != 0) {


                %>
                <table style="width:45%;">
                    <tr>
                        <td>Employee Number</td>
                        <td>First Name</td>
                        <td>Last Name</td>
                        <td>Identity Number</td>
                        <td>Company</td>
                        <td>Salary</td>
                        <td>Choose</td>
                    </tr>
                    <%                    for (Employee employee : empList) {
                           
                    %>
                    <tr>
                        <td><%=employee.getEmployeeno()%></td>
                        <td><%=employee.getFirstname()%></td>
                        <td><%=employee.getLastname()%></td>
                        <td><%=employee.getIdno()%></td>
                        <td><%=employee.getCompanyname()%></td>
                        <td><%=employee.getSalary()%></td>
                        <td><input type="radio" name="selectedStaffNo" value=<%=employee.getEmployeeno()%></td>
                    </tr>
                    <%
                        }
                    %>

                </table>

                <%
                } else {
                %>
                <p style="font-weight: bold; color: gray">No Employee information available!</p>
                <%
                    }
                %>
            </div>
            <div align="center">
                <input type="submit" name="param" value="New Profile">
                <input type="submit" name="param" value="Edit Profile">
                <input type="submit" name="param" value="Delete Profile">
            </div>
            <div align="center">
                <%
                    String successMessage = (String) request.getAttribute("successMessage");
                    if (successMessage != null) {
                %>
                <p style="color:green"><%=successMessage%></p>
                <%

                    }
                %>
            </div>
        </form>
    </body>
</html>
