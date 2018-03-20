/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

/**
 *
 * @author frankkung
 */
public class HTMLParser {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
      
    }

    private static final String BASE_URL = "https://batdongsan.com.vn/";

    public static List<Item> getItems(String uri) {
        List<Item> result = new ArrayList<>();
        try {

            Document doc = Jsoup.connect(BASE_URL + uri).get();
           
            //          get description
            Elements items = doc.getElementsByClass("search-productItem");
//        System.out.println(items);
            for (Element it : items) {
                Item item = new Item();
                String title = it.select(".p-title").text();
                String url = it.select(".p-title h3 a").attr("href");
                item.setUrl(url);
                item.setTitle(title);
                String image = it.select(".product-avatar img").attr("src");
                item.setImage(image);
                String desc = it.select(".p-main-text").text();
                item.setDescription(desc);
                String price = it.select(".product-price").text();
                item.setPrice(price);
                String area = it.select(".product-area").text();
                String location = it.select(".product-city-dist").text();
                item.setArea(area);
                item.setLocation(location);
                result.add(item);

            }
//        System.out.println(item);
        } catch (IOException ex) {
            Logger.getLogger(HTMLParser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public static Detail getDetail(String uri) {
        Detail dt = new Detail();
        try {
            // TODO code application logic here
            Document doc = Jsoup.connect(BASE_URL + uri).get();

            String title = doc.getElementsByClass("pm-title").text();
            dt.setTitle(title);
            String des = doc.select(".kqchitiet a").attr("href");
            dt.setDesc(des);
             String location = doc.select(".diadiem-title").text();
            dt.setLocation(location.substring(location.indexOf(":")+1,location.length()));
            String price =doc.select(".gia-title strong").text();
            String []temp = price.split("\\s+");
            dt.setArea(temp[temp.length-1]);
           price = "";
            for(int i =0;i<temp.length-1;i++){
                price +=temp[i]+" ";
            }
            dt.setPrice(price.trim());
            String type = doc.getElementsByClass("prd-more-info").html();
            dt.setType(type);
            String GetDescription = GetDescription(doc);
            dt.setContent(GetDescription);

            dt.setImages(GetImages(doc));

            List<LandDetail> landDetails = new ArrayList<>();
            for (Map.Entry<String, String> entry : GetLandDetails(doc).entrySet()) {
                String key = entry.getKey();
                String value = entry.getValue();
                LandDetail landDetail = new LandDetail();
                landDetail.setHeader(key);
                landDetail.setContent(value);
                landDetails.add(landDetail);
            }
            ListLandDetail listLandDetail = new ListLandDetail();
            listLandDetail.setLands(landDetails);
            dt.setLanddetail(listLandDetail);

            List<LandLordDetail> landLordDetails = new ArrayList<>();
            for (Map.Entry<String, String> entry : GetLandLordDetails(doc).entrySet()) {
                String key = entry.getKey();
                String value = entry.getValue();
                LandLordDetail landLordDetail = new LandLordDetail();
                landLordDetail.setHeader(key);
                landLordDetail.setContent(value);
                landLordDetails.add(landLordDetail);

            }
            ListLandLordDetail listLandLordDetail = new ListLandLordDetail();
            listLandLordDetail.setLands(landLordDetails);
            dt.setLandlorddetail(listLandLordDetail);

//            GetLandDetails(doc);
//            GetLandLordDetails(doc);
            //Get Desc
        } catch (IOException ex) {
            Logger.getLogger(HTMLParser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return dt;
    }

    private static String GetDescription(Document doc) {
        //          get description
        Elements desc = doc.getElementsByClass("pm-desc");
        String description = desc.html();
        return description;
    }

    private static ListImage GetImages(Document doc) {
        //          get image s link
        List<Image> result = new ArrayList<>();
        ListImage li = new ListImage();
        Elements images = doc.select("#thumbs li img");
        for (Element img : images) {
            Image ig = new Image();
            ig.setUrl(img.attr("src"));
            result.add(ig);
        }
        li.setImage(result);
        return li;
    }

    private static Map<String, String> GetLandDetails(Document doc) {
//         get details of land
        Elements details = doc.select(".div-hold .table-detail .row");
        Map<String, String> maps = new HashMap<>();
        for (Element e : details) {
            maps.put(e.select(".left").text(), e.select(".right").text());
        }
        return maps;
    }

    private static Map<String, String> GetLandLordDetails(Document doc) {
//    owner info
        Map<String, String> maps = new HashMap<>();
        Elements details = doc.select("#divCustomerInfo .right-content");
        for (Element e : details) {
            maps.put(e.getElementsByClass("normalblue left").text(), e.getElementsByClass("right").text());
        }
        return maps;
    }

}
