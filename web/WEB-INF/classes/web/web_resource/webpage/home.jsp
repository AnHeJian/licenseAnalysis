<%--
  Created by IntelliJ IDEA.
  User: LiveAn
  Date: 2018/4/11
  Time: 14:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Home</title>
    <style type="text/css">
        body{
            background-color: #FAFAFA
        }
        h1{
            text-align: center;
            font-size: 50px;
            font-weight: bolder;
            color: #444444;
        }
        h2{
            text-align: center;
            font-size: 30px;
            font-weight: bolder;
            color: #444444;
        }
        h3{
            color: #149AD4;
            margin-bottom: 0;
        }
        #menu{
            padding: 0px 0px;
        }
        .introduction{
            text-align: center;
            list-style: none;
            float: left;
            word-break: normal;
            width: 50%;
        }
        .introduction ul{
            text-align: left;
            padding:0 15%;
            list-style-image: url("../images/icons/finger-click.png");
        }
        .analysis{
            text-align: center;
            list-style: none;
            float: right;
            word-break: normal;
            width: 50%;
        }
        .analysis ul{
            list-style-image: url("../images/icons/finger-click.png");
            text-align: left;
            padding:0 15%;
        }
        a{text-decoration: none}
        p{
            color: #000000;
            margin-top: 6px;
        }
    </style>
</head>
<body>
<h1>
    Open Source License Introduction and Anlysis
</h1>
<br>
<ul id="menu">
    <li class="introduction">
        <img src="../images/icons/Category.png" height="100" width="100">
        <h2 style="margin-top: 0">Introduction and Recommendation</h2>
        <ul>
            <li>
                <a href="./introduction/introduction.jsp">
                    <h3>Introduction</h3></a>
                <p>a permissive license that is short and to the point. It lets people do anything they want with your code as long as they provide attribution back to you and don’t hold you liable.</p>
            </li>
            <br>
            <li>
                <a href="./recommendation/recommendation.jsp">
                    <h3>Recommendation</h3></a>
                <p>a permissive license that is short and to the point. It lets people do anything they want with your code as long as they provide attribution back to you and don’t hold you liable.</p>
            </li>
        </ul>

    </li>
    <li class="analysis">
        <img src="../images/icons/survey.png" height="100" width="100">
        <h2 style="margin-top: 0">Compliance and Conflict Analysis</h2>
        <ul>
            <li>
                <a href="./compliance/compliance.jsp">
                    <h3>Compliance Analysis</h3></a>
                <p>a permissive license that is short and to the point. It lets people do anything they want with your code as long as they provide attribution back to you and don’t hold you liable.
                </p>
            </li>
            <br>
            <li>
                <a href="./conflict/conflict.jsp">
                    <h3>Conflict Analysis</h3></a>
                <p>a permissive license that is short and to the point. It lets people do anything they want with your code as long as they provide attribution back to you and don’t hold you liable.</p>
            </li>
        </ul>
    </li>
</ul>

</body>
</html>