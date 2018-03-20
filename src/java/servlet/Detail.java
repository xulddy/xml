/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.util.List;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author tan
 */
@XmlRootElement
public class Detail {
    private String title;
    private String desc;
    private ListImage images;
    private ListLandDetail landdetail;
    
    private ListLandLordDetail landlorddetail;
    
    private String type;
    private String content;
    private String location;
    private String price;
    private String area;

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }
    
    

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }
    

    public ListLandDetail getLanddetail() {
        return landdetail;
    }

    public void setLanddetail(ListLandDetail landdetail) {
        this.landdetail = landdetail;
    }

    public ListLandLordDetail getLandlorddetail() {
        return landlorddetail;
    }

    public void setLandlorddetail(ListLandLordDetail landlorddetail) {
        this.landlorddetail = landlorddetail;
    }

   
    
    
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getContent() {
        return content;
    }

    public ListImage getImages() {
        return images;
    }

    public void setImages(ListImage images) {
        this.images = images;
    }

   
 
    

    public void setContent(String content) {
        this.content = content;
    }
    
    
    
    
    
    
}
