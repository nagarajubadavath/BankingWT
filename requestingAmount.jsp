<html>
    <head>
        <style>
            *{
                margin:0px;
                padding:0px;
            }
            body{
                background-image: url(Bank2.jpg);
                background-repeat: no-repeat;
                background-size: cover;
            }
            .display{
                margin:150px;
                display:flex;
                align-items: center;
                justify-content: center;
            }
        </style>
    </head>
    <body>
        <%
        int cid=Integer.parseInt(request.getParameter("cid"));
        String cname=request.getParameter("cname");
        Double amount=Double.parseDouble(request.getParameter("amount"));
        String action=request.getParameter("action");
        //session
        session.setAttribute("cname",cname);
        session.setAttribute("cid",cid);
        session.setAttribute("amount",amount);
        session.setAttribute("action",action);
        %>
        <div class="display">
        <form action="updateBalance.jsp" method="post">
            <label style="font-size: larger;" for="num">Amount:</label><br>
            <input style="padding: 10px;" type="number" id="num" name="num" placeholder="Enter amount"><br>
            <input type="submit" value="Enter">
        </form>
        </div>
    </body>
</html>
