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
public class ListLandDetail {
    
    private List<LandDetail> lands;

    public List<LandDetail> getLands() {
        return lands;
    }

    public void setLands(List<LandDetail> lands) {
        this.lands = lands;
    }
    
    
}
