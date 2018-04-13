<%--
  Created by IntelliJ IDEA.
  User: LiveAn
  Date: 2018/4/11
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>license_compliance</title>
    <link rel="stylesheet" href="../../css/title_index.css">
    <style>
        main{
            clear: both;
        }

        main .file-box{
            padding-top: 20px;
        }

        .file-box{
            position: relative;
            width: 100%;
        }
        .file-box #fileField{
            filter:alpha(opacity:0);
            opacity: 0;
        }
        .file-box #select_file_button{
            position: absolute;
            left: 0;
            width: 68px;
            height: 23px;
            background-color:#FFF;
            border:1px solid #CDCDCD;
        }
        .file-box #select_file_text {
            position: absolute;
            left: 75px;
            height: 23px;
        }
        .file-box #fileSubmit{
            height: 23px;
            background-color:#FFF;
            border:1px solid #CDCDCD;
        }
        .file-box #uploadInfo{
            border: none;
        }

        #complianceInfo{
            font-size: 18px;
            overflow: auto;
            word-break: normal;
            width: 100%;
            height: auto;
            border: none;
        }
    </style>

</head>
<body>
<nav>
    <ul>
        <li><a href="../home.jsp">Home</a></li>
        <li><a href="../introduction/introduction.jsp">Introduction</a></li>
        <li><a href="../recommendation/recommendation.jsp">Recommendation</a></li>
        <li class="current_index"><a href="compliance.jsp">Compliance Analysis</a></li>
        <li><a href="../conflict/conflict.jsp">Conflict Analysis</a></li>
    </ul>
</nav>

<main>
    <div class="file-box">
        <p class="text">upload single file:</p>
        <form id="fileform" enctype="multipart/form-data">
            <input type="button" id="select_file_button" value="Browse..">
            <input type="text" id="select_file_text" readonly="true">
            <input type="file" name="fileField" id="fileField" onchange="fileClick()"/>

            <input type="button" name="fileSubmit" id="fileSubmit" onclick="fileUpload()" value="Upload&Analyse" disabled="true"/>
            <input type="text" name="uploadInfo" id="uploadInfo" readonly="true" hidden="true">
        </form>
    </div>
    <div class="compliance-box">
        <textarea id="complianceInfo" disabled="true" rows="20"></textarea>
    </div>
</main>
</body>

<script type="text/javascript" src="../../js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" >
    function fileUpload() {
//        var fm=document.getElementById('fileform'); //获取表单对象
//        var form=new FormData(fm);                  //实例化FormData对象
//        var url = "uploadFile";                     // 接收上传文件的后台地址
//        xhr = new XMLHttpRequest();                 // XMLHttpRequest 对象
//        xhr.open("post", url, true);                //post方式，url为服务器请求地址，true 该参数规定请求是否异步处理。
//        xhr.send(form);                             //开始上传，发送form数据
//        xhr.onreadystatechange = function () {
//            if(xhr.readyState == 4){
//                if(xhr.responseText == 1){
//                    alert("success");
//                }else{
//                    alert("failed");
//                }
//            }
//        }

        $("#uploadInfo").attr("hidden", false);
        $("#uploadInfo").attr("value", "uploading...");
        var form = new FormData(document.getElementById("fileform"));
        $.ajax({
            url: "uploadFile",
            type: "POST",
            data: form,
            processData: false,
            contentType: false,
            success: function (data) {
                $("#uploadInfo").attr("value", "upload success");
                $("#complianceInfo").append(data)
            },
            error: function () {
                $("#uploadInfo").attr("value", "upload failed");
            }
        });
    }

    function fileClick() {
        $("#fileSubmit").attr("disabled", false);
        var fileInfo = $("#fileField").val();
        if(fileInfo!="") {
            var index =fileInfo.lastIndexOf("\\");
            var name = fileInfo.substr(index + 1);
            $("#select_file_text").attr("value", name);
        }
    }
</script>

</html>
