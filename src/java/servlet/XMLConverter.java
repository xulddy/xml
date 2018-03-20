/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.StringWriter;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;

/**
 *
 * @author tan
 */
public class XMLConverter {
 
    
	public static String convertDetail(Detail item) {

		StringWriter writer = new StringWriter();

		if (item != null) {

			try {
				JAXBContext context = JAXBContext.newInstance(Detail.class);
				
				Marshaller marshaller = context.createMarshaller();
				
				marshaller.marshal(item, writer);
				
			} catch (JAXBException e) {
				e.printStackTrace();
			}
		}

		return writer.toString();
	}
	public static String convert(ListItem items) {

		StringWriter writer = new StringWriter();

		if (items != null) {

			try {
				JAXBContext context = JAXBContext.newInstance(ListItem.class);
				
				Marshaller marshaller = context.createMarshaller();
				
				marshaller.marshal(items, writer);
				
			} catch (JAXBException e) {
				e.printStackTrace();
			}
		}

		return writer.toString();
	}
}
