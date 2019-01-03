/*
 * problemas para 
 */
package com.muqui.corona.controller;
import com.muqui.corona.model.EstadisticaEquipo;
import com.muqui.corona.model.EstadisticaPartido;
import com.muqui.corona.model.Estadisticas;
import com.muqui.corona.service.EstadisticasService;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author mq12
 */
@Controller

public class EstadisticaControllador {
      @Autowired
    EstadisticasService estadisticasService;
      List<EstadisticaEquipo> listequipos;

    EstadisticaControllador(){
      
    }  
     

      
    @RequestMapping(value = {"/estadisticas"}, method = RequestMethod.GET)
    public String estadisticas(ModelMap model) {
         
        listequipos = estadisticasService.getEquipos();
        model.addAttribute("estadisticaPartido", new EstadisticaPartido());
      return "estadisticas/indexSinJavascrip";
    }
     @RequestMapping(value = "/estadisticas", method = RequestMethod.POST)
   public String estadisticapost(@ModelAttribute("estadisticaPartido")Estadisticas student, 
   ModelMap model) {
        Estadisticas estadisticas = estadisticasService.getEstadsiticas(student);
      model.addAttribute("estadisticas", estadisticas );
     
      
      return "estadisticas/indexSinJavascrip";
   }

   
     @RequestMapping(value = {"/resultadosestadistica"}, method = RequestMethod.GET)
    public String resultados(ModelMap model) {
        model.addAttribute("torneos" , estadisticasService.getLigas());
        model.addAttribute("estadisticaPartido", new EstadisticaPartido());
       listequipos = estadisticasService.getEquipos();
        return "estadisticas/resultadosestadistica";
    }
//    
//    
    @RequestMapping(value = "/altaequipo", method = RequestMethod.POST)
     @ResponseBody
     public String estadisticaAltaPartido(EstadisticaPartido contact) {
        
        String retorno =   estadisticasService.estadisticaSavePartido(contact);
          
            return retorno;       
     }
//   

	    
    @RequestMapping(value = "/getTags", method = RequestMethod.GET)
	public @ResponseBody
	List<EstadisticaEquipo> getTags(@RequestParam String nombre) {

		return simulateSearchResult(nombre);

	}

	private List<EstadisticaEquipo> simulateSearchResult(String tagName) {

		List<EstadisticaEquipo> result = new ArrayList<EstadisticaEquipo>();
            System.out.println("Comprobar existencia de asfdff::::::::.  ...........     ....... " +  tagName );
		// iterate a list and filter by tagName
		for (EstadisticaEquipo tag : listequipos) {
                    //s.toLowerCase().contains("ABCD".toLowerCase());
                   if (tag.getNombre().toLowerCase().contains(tagName.toLowerCase())) {
			//if (tag.getNombre().contains(tagName)) {
				result.add(tag);
			}
		}

		return result;
	}

}
