<%@page import="java.sql.*,java.util.*"%>
<%
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Banking","raju","Nagaraju1136@");
    String sql="select * from cdetails";
    Statement st=conn.createStatement();
    ResultSet resultset=st.executeQuery(sql);
    %>
    <html>
        <head>
            <style>
                body{
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    background-image: url("Bank2.jpg");
                    background-repeat:repeat;
                    background-size: cover;
                    
                }
                .show{
                    margin:100px;
                    padding:20px;
                    display:flex;
                    align-items: center;
                    justify-content: center;
                }
               .tab{
                border-radius: 12px;
                padding:10px;
                text-align: center;
                font-size: larger;
                font-weight: 300;
               }
               #btn1,#btn2{
                margin-top:10px;
                padding:10px;
               }
            </style>
        </head>
    <body>
        <div class="show">
    <table border='1' class="tab">
    <tr>
    <th>Id</th>
    <th>Cname</th>
    <th>Amount</th>
    <th>withdraw</th>
    <th>Deposit</th>
    </tr>
    <%
    while(resultset.next())
    {
        String cid=resultset.getString("cid");
        String cname=resultset.getString("cname");
        String amount=resultset.getString("amount");
        %>
        <tr><td><%=cid%></td>
        <td><%=cname%></td>
        <td><%=amount%></td>
        <td>
            <form action='requestingAmount.jsp' method='post'>
                <input type='hidden' name='cid' value='<%=cid%>'>
                <input type='hidden' name='cname' value='<%=cname%>'>
                <input type='hidden' name='amount' value='<%=amount%>'>
                <button type='submit' id="btn1" name='action' value='withdraw'>Withdraw</button>
            </form>
        </td>
        <td>
                <form action='requestingAmount.jsp' method='post'>
                    <input type='hidden' name='cid' value='<%=cid%>'>
                    <input type='hidden' name='cname' value='<%=cname%>'>
                    <input type='hidden' name='amount' value='<%=amount%>'>
                    <button type='submit' id="btn2" name='action' value='deposit'>deposit</button>
                </form>
        </td>
        </tr>

        <%
    }
    %>
</div>
    </table></body></html>
    <%
}catch(Exception e)
{
    out.println(e.getMessage());
}
%>