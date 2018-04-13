package com.seu.licenseAnalysis.servlet;

import com.seu.licenseAnalysis.analysis.licenseType;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet(name = "uploadFileServlet")
public class uploadFileServlet extends HttpServlet {

    licenseType analyst = new licenseType();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //先判断是否是文件上传类型enctype="multipart/form-data"
        boolean isFileUpload = ServletFileUpload.isMultipartContent(request);
        //如果是文件上传类型
        try {
            if (isFileUpload) {
                //得到文件上传工厂
                FileItemFactory factory = new DiskFileItemFactory();
                //处理文件上传核心类
                ServletFileUpload fileUpload = new ServletFileUpload(factory);
                //设置文件上传类的编码格式
                fileUpload.setHeaderEncoding("UTF-8");

                // 集合数据 :  FileItem对象 注意: 每一个表单域 对应一个 FileItem对象(封装)
                List<FileItem> fileItemList = null;
                fileItemList = fileUpload.parseRequest(request);

                for (FileItem item : fileItemList) {
                    //如果这个文本域是文件类型的
                    if (!item.isFormField()) {
                        //文件为空
                        if(item.getSize() == 0){
                            request.setAttribute("uploadInfo", "the file is empty!");
                        }
                        else {
                            //打印文本内容
                            //String content = item.getString();
                            //System.out.println(content);

                            //得到文本域的value值，即 路径+文件名
                            String value = item.getName();
                            //得到文件名
                            String fileRowName = value.substring(value.lastIndexOf("\\") + 1);
                            //给文件重新命名 日期+文件名
                            String fileName = new Date().getTime() + fileRowName;

                            //得到服务器的根路径
                            String rootPath = this.getServletContext().getRealPath("/");
                            //指定文件存放路径
                            String realPath = rootPath+"/"+"upload";
                            //定义文件存放的目录，注意 目录也是文件
                            File file = new File(realPath);
                            //如果目录不存在
                            if (!file.isDirectory()) {
                                //创建文件上传目录
                                file.mkdirs();
                            }
                            File newFile = new File(realPath + "/" + fileName);
                            //向newFile文件中写入数据
                            item.write(newFile);

                            //分析许可证类型
                            String licenseType =analyst.getType(newFile.toString());

                            //向前台发送数据
                            System.out.println(fileRowName);
                            response.getWriter().print(fileRowName+"\ncompliance report:\n"+"blablabla");
                        }
                    }
                }
            }
        }
        catch(Exception e){
            e.printStackTrace();
            request.setAttribute("uploadInfo", "upload failed");
        }
        //request.getRequestDispatcher("/result.jsp" ).forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
