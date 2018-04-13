<%--
  Created by IntelliJ IDEA.
  User: LiveAn
  Date: 2018/4/11
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>licenses_conflict</title>
    <link rel="stylesheet" href="../../css/title_index.css">
    <style>
        main{
            clear: both;
        }

        main .folder-box{
            padding-top: 20px;
        }

        .folder-box{
            position: relative;
            width: 100%;
        }
        .folder-box #folderField{
            filter:alpha(opacity:0);
            opacity: 0;
        }
        .folder-box #select_folder_button{
            position: absolute;
            left: 0;
            width: 68px;
            height: 23px;
            background-color:#FFF;
            border:1px solid #CDCDCD;
        }
        .folder-box #select_folder_text {
            position: absolute;
            left: 75px;
            height: 23px;
        }
        .folder-box #folderSubmit{
            height: 23px;
            background-color:#FFF;
            border:1px solid #CDCDCD;
        }
        .folder-box #uploadInfo{
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
        <li><a href="../compliance/compliance.jsp">Compliance Analysis</a></li>
        <li class="current_index"><a href="conflict.jsp">Conflict Analysis</a></li>
    </ul>
</nav>
<main>
    <div class="folder-box">
        <p class="text">upload the project folder:</p>
        <form id="folderform" enctype="multipart/form-data">
            <input type="button" id="select_folder_button" value="Browse..">
            <input type="text" id="select_folder_text" readonly="true">
            <input type="file" webkitdirectory multiple name="folderField" id="folderField"/>

            <input type="button" name="folderSubmit" id="folderSubmit" onclick="folderUpload()" value="Upload&Analyse" disabled="true"/>
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
    function folderUpload() {
        $("#uploadInfo").attr("hidden", false);
        $("#uploadInfo").attr("value", "uploading...");
        var form = new FormData(document.getElementById("folderform"));
        $.ajax({
            url: "uploadFolder",
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

    document.getElementById("folderField").addEventListener("change", function(event) {
        var files = $(this).val();
        if(files!=""){
            var filesList = event.target.files;
            var filesCount = filesList.length;
            var filesRoot = filesList[0].name;
            $("#select_folder_text").attr("value",filesRoot +" 等共" + filesCount.toString()+"个文件");
            $("#folderSubmit").attr("disabled", false);
        }
    }, false);

</script>

</html>
