package com.seu.licenseAnalysis.servlet;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "uploadFolderServlet")
public class uploadFolderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//先判断是否是文件上传类型enctype="multipart/form-data"
        boolean isFileUpload = ServletFileUpload.isMultipartContent(request);
        int files_count = 0;
        //如果是文件上传类型
        try {
            if (isFileUpload) {
                //创建磁盘工厂
                DiskFileItemFactory factory = new DiskFileItemFactory();
                //创建处理工具
                ServletFileUpload fileUpload = new ServletFileUpload(factory);
                //服务器端可以接收的最大文件大小，-1表示无上限
                fileUpload.setSizeMax(10 * 1024 * 1024);
                //设置文件上传类的编码格式
                fileUpload.setHeaderEncoding("UTF-8");

                // 集合数据 :  FileItem对象 注意: 每一个表单域 对应一个 FileItem对象(封装)
                List<FileItem> fileItemList = null;
                fileItemList = fileUpload.parseRequest(request);
                for (FileItem item : fileItemList) {
                    //如果这个文本域是文件类型的
                    if (!item.isFormField()) {
                        files_count++;
                        //显示上传的文件的原始位置
                        System.out.println(item.getName());
                    }
                }

                //向前台发送数据
                response.getWriter().print(files_count+" files\nconflict report:\nblablabla");
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
