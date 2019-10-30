package com.csdj.servlet.lkl;

import com.csdj.entity.FsPost;
import com.csdj.entity.FsUser;
import com.csdj.service.lkl.PostMsgService;
import com.sun.javafx.collections.MappingChange;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/fileupload")
public class FileUpload {
    @Resource
    PostMsgService service;
    String msg="";
    MultipartFile[] flies=new MultipartFile[0];
    //得到选中文件的路径
    @RequestMapping("file_up")
    @ResponseBody
    public List<String> get_url( @RequestParam(value = "file",required = false) MultipartFile[] multipartFile, @RequestParam(value = "msg",required = false) String te){
        try {
            System.out.println(multipartFile.length+te);
        }catch (Exception e){
            System.out.println("上传出现错误");
        }
        List<String> list=new ArrayList<>();
        try {
            flies=multipartFile;
            msg=te;
            list.add("1");
        }catch (Exception e){
            list.add("0");
        }
        return list;
    }


    @RequestMapping("post_msg")
    public String post_msg(FsPost fsPost, HttpServletRequest request){
        FsUser user=(FsUser) request.getSession().getAttribute("user");
        fsPost.setPosterId(user.getId());
        fsPost.setForwarding(2);
        fsPost.setFirstLabel(1);
        fsPost.setHeat(0);
        fsPost.setPostTitile("111");
        //是否为真实用户
        fsPost.setIsSelfAccount(1);
        fsPost.setPostTypeId(1);
        String path=fileUser(request);
        if (msg.equals("图片")){
            fsPost.setPicturePath(path);
            fsPost.setVideoPath(null);
        }
        else if (msg.equals("视频")){
            fsPost.setVideoPath(path);
            fsPost.setPicturePath(null);
        }
        else{
            fsPost.setPicturePath(null);
            fsPost.setVideoPath(null);
        }
        if (service.postmsg(fsPost)>0){
            System.out.println("发送成功");
        }
        return null;
    }
    public String fileUser(HttpServletRequest request) {
        String path="";
        if (msg.equals("图片")){
            path="C:\\Users\\29007\\Desktop\\项目\\项目er\\Funny-Soul\\FunnySoul\\src\\main\\webapp\\postmsg\\images";
        }else if (msg.equals("视频")){
            path="C:\\Users\\29007\\Desktop\\项目\\项目er\\Funny-Soul\\FunnySoul\\src\\main\\webapp\\postmsg\\mpg";
        }
        System.out.println(path);
        int filesize=500000;//限制文件大小
        String idPicPath=null;//文件存储数据库路径
//        String workPicPath=null;
        boolean flag=true;
        if (flies.length>0) {
            for (int i=0;i<flies.length;i++) {
                String newname=null;
                if (!flies[i].isEmpty()) {
                    MultipartFile multipartFile=flies[i];
                    String filename=multipartFile.getOriginalFilename();//获取文件名
                    String suffixname= FilenameUtils.getExtension(filename);//获取后缀名
                    //判断文件大小是否超出指定长度
                    if (multipartFile.getSize()>filesize) {
                        System.out.println("------------------------>"+"文件超出指定长度"+filesize);
                        flag=false;
                    }
                    //判断文件类型是否符合规范
                    else if (
                            suffixname.equalsIgnoreCase("jpg") ||
                            suffixname.equalsIgnoreCase("png") ||
                            suffixname.equalsIgnoreCase("jpeg") ||
                            suffixname.equalsIgnoreCase("pneg") ||
                            suffixname.equalsIgnoreCase("avi") ||
                            suffixname.equalsIgnoreCase("rmvb") ||
                            suffixname.equalsIgnoreCase("rm") ||
                            suffixname.equalsIgnoreCase("mp4") ||
                            suffixname.equalsIgnoreCase("flv") ||
                            suffixname.equalsIgnoreCase("mpg") ||
                            suffixname.equalsIgnoreCase("qlv")
                    ){
                        String uuid = UUID.randomUUID().toString().replace("-", "");
                        //新文件名=UUID+当前毫秒数+res+文件扩展名
                        newname=uuid+System.currentTimeMillis()+""+"_res."+suffixname;
                        File file = new File(path,newname);
                        //判断文件夹是否存在  如果不存在则创建文件夹
                        if (!file.exists()) {
                            file.mkdirs();
                        }
                        try {
                            multipartFile.transferTo(file);
                        } catch (IllegalStateException e) {
                            //TODO如果文文件上传出现问题
                            flag=false;

                            e.printStackTrace();
                        } catch (IOException e) {

                            e.printStackTrace();
                        }
                    }else {
                        System.out.println("------------------------>"+"文件格式不正确");
                        flag=false;
                    }


                    idPicPath=newname;
                    System.out.println(idPicPath+"图片路径");
//                    workPicPath+=";"+idPicPath;

                }


            }
        }

        return idPicPath;

    }
}
