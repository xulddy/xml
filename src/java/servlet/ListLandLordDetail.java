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
public class ListLandLordDetail {
    
    private List<LandLordDetail> lands;

    public List<LandLordDetail> getLands() {
        return lands;
    }

    public void setLands(List<LandLordDetail> lands) {
        this.lands = lands;
    }
    
    
}
