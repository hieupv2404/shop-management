package shoppingcart.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;

@Service
public class UploadService {
    @Value("${config.upload_folder}")
    String UPLOAD_FOLDER;//     /Users/lrandom/Documents/spring_uploads/
    public String upload(MultipartFile file) {
        String relativeFilePath =null;
        Date date = new Date();
        LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        int year = localDate.getYear();//2021
        int month = localDate.getMonthValue();//06
        String subFolder = month+"_"+year+"/";//06_2021/
        String fullUploadDir = UPLOAD_FOLDER+subFolder;
        File checkDir = new File(fullUploadDir);
        if (!checkDir.exists() || checkDir.isFile()) {
            //tạo mới folder
            checkDir.mkdir();
        }

        try {
            System.out.println("ảnh file" + file.getOriginalFilename());
            if (file.getOriginalFilename() == null || file.getOriginalFilename().equals("")) {
                relativeFilePath = subFolder  + "1633417261{87F9786F-8D4F-418A-B278-6AE81A564CCE}.png.jpg";
                System.out.println("sai"+relativeFilePath);
            } else {
                relativeFilePath = subFolder + Instant.now().getEpochSecond() + file.getOriginalFilename();
                Files.write(Paths.get(UPLOAD_FOLDER + relativeFilePath), file.getBytes());
                System.out.println("dung"+relativeFilePath);
            }
        } catch (Exception e) {
            System.out.println("cannot upload file");
            e.printStackTrace();
            return null;
        }

        return relativeFilePath;
    }
}
