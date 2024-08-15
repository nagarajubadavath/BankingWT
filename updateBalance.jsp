<%@page import="java.sql.*,java.util.*"%>
<%
    String moneyStr = request.getParameter("num");
    double money = (moneyStr != null && !moneyStr.isEmpty()) ? Double.parseDouble(moneyStr) : 0.0;

    String cname = (String) session.getAttribute("cname");
    Integer cid = (Integer) session.getAttribute("cid");   
    Double amount = (Double) session.getAttribute("amount"); 
    String action = (String) session.getAttribute("action");

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Banking","raju","Nagaraju1136@");
        String sql=null;
        if("withdraw".equals(action))
        {
            if(amount>=money)
            {
                sql="update cdetails set amount=amount-? where cid=?";
            }else{
                %>
                <html>
                    <head>
                        <style>
                            *{
                                margin:0px;
                                padding:0px;
                            }
                            body{
                                background-color: black;
                            }

                            .display{
                                margin:200px;
                                display:flex;
                                align-items: center;
                                justify-content:center;
                            }
                        </style>
                    </head>
                </html>
                <body>
                    <div class="display">
                    <p style="font-size: larger; color:white">Insufficient Balance</p>
                    </div>
                </body>
                </html>
                <%
            }
        }else{
            sql="update cdetails set amount=amount+? where cid=?";
        }
        PreparedStatement ps=conn.prepareStatement(sql);
        ps.setDouble(1,money);
        ps.setInt(2,cid);
        int x=ps.executeUpdate();
        if(x>0)
        {
            response.sendRedirect("show.jsp");
        }else{
            response.sendRedirect("show.jsp");
        }
    }catch(Exception e)
    {
        e.getMessage();
    }
%>
