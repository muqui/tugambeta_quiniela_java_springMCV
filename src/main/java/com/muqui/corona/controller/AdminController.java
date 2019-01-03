/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.muqui.corona.controller;

import com.muqui.corona.model.EstadisticaTorneo;
import com.muqui.corona.service.QuinielaService;
import com.muqui.corona.model.Partidos;
import com.muqui.corona.model.Quiniela;
import com.muqui.corona.model.Users;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author mq12
 */
@Controller
public class AdminController {

    @Autowired
    QuinielaService quinielaService;

    @RequestMapping(value = "/admin**", method = RequestMethod.GET)
    public String adminPageget(ModelMap model, HttpSession session, HttpServletRequest request, @RequestParam(value = "f", required = false) String flush, @RequestParam(value = "message", required = false) String message) {


        /*
            crear quiniela
         */
        if (flush != null) {
            session.setAttribute("partidoLista", getDummyPartidosLista());
        }
        if (session.getAttribute("partidoLista") == null) {
            session.setAttribute("partidoLista", getDummyPartidosLista());
        }
        model.addAttribute("partidoLista", (Quiniela) session.getAttribute("partidoLista"));
        if (message != null) {
            model.addAttribute("message", message);
        }
        model.addAttribute("cp", request.getContextPath());

        return "admin/admin";
        // return quinielaService.ruta(pagina, "jugaradmin");
    }

    @RequestMapping(value = "/admin/editpersonlistcontainer", method = RequestMethod.POST)
    public String editpersonListContainer(@ModelAttribute Quiniela quiniela, HttpSession session) {
//        for (Partidos p : quiniela.getPartidoses()) {
//            System.out.println("Local: " + p.getLocal());
//            System.out.println("Visitante: " + p.getVisitante());
//        }
        try {

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            SimpleDateFormat output = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date d = sdf.parse(quiniela.getFechaTemporal());
            Timestamp timeStampDate = new Timestamp(d.getTime());
            quiniela.setFechaLimite(timeStampDate);

            String formattedTime = output.format(d);
            //   System.out.println(" timerewrwADmin " + formattedTime);
        } catch (Exception e) {//this generic but you can control another types of exception
            // System.out.println("E" + e);
        }

        // System.out.println(" nombre quiniela ............................................................................" + quiniela.getNombre());
        // System.out.println(" fecha ............................................................................" + quiniela.getFechaLimite());
        //  System.out.println(" nombre pagina xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx " + quiniela.getPagina().getNombre());
        quinielaService.saveQuiniela(quiniela);

        // employeeService.saveQuiniela(new Quiniela(quiniela.getPagina(), quiniela.getNombre(), (Timestamp) quiniela.getFechaLimite(), quiniela.getPartidoses(), null, null));
        // personService.saveQuiniela(new Quiniela(quiniela.getPagina(), quiniela.getNombre(), (Timestamp) quiniela.getFechaLimite(), 
        //      quiniela.getPartidoses(), null, null));
        return "redirect:/admin";

    }

    @RequestMapping("/admin/actualquiniela")
    public String actual(@ModelAttribute Quiniela quiniela, @RequestParam String id, ModelMap model) {
        // System.out.println("id Quinielaaaaaaaaaaaaaaaaaaa   xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxyyyyyy   = " + id);
        quinielaService.setQuinielaActual(id);

        return "redirect:/admin";
    }

    @RequestMapping("/admin/administrarquiniela")
    public String editar(@RequestParam String id, HttpSession session) {
        session.setAttribute("sessionIDQuiniela", id);
        return "admin/administrarquiniela";
        // return "redirect:/admin/resultados";
    }

    @RequestMapping(value = "/admin/resultados**", method = RequestMethod.GET)
    public String crearQuiniela(ModelMap model, HttpSession session, HttpServletRequest request, @RequestParam(value = "f", required = false) String flush, @RequestParam(value = "message", required = false) String message) {
        // model.addAttribute("partidoLista", (Quiniela) session.getAttribute("partidoLista"));
        int idQuiniela = Integer.parseInt(session.getAttribute("sessionIDQuiniela").toString());
        // System.out.println("Id session quiniela: " + idQuiniela);

        model.addAttribute("partidos", quinielaService.getPartidos(idQuiniela));
        //  model.addAttribute("user", userId);
        //  Pagina  pagina = employeeService.getPagina(userId);
        return "admin/resultados";

    }

    @RequestMapping("/admin/editar")
    public String editUser(@RequestParam String id, ModelMap model) {

        model.addAttribute("partido", quinielaService.getPartidoActualizar(id));

        return "admin/editar";

    }

    @RequestMapping("/admin/update")
    public String updateUser(@ModelAttribute("partido") Partidos partido, ModelMap model, HttpSession session) {
        //System.out.println("x partido xxxxxxxxxxxxxx&&&&&&''''?????" + partido.getIdpartidos() + " local " + partido.getLocal() + " visita " + partido.getVisitante());
        int idQuiniela = Integer.parseInt(session.getAttribute("sessionIDQuiniela").toString());

        // employeeService.actualizarResultado(partido,userId );
        quinielaService.actualizarResultado(partido, idQuiniela);

        return "redirect:/admin/resultados";

    }

    @RequestMapping("/admin/eliminarparticipante")
    public String eliminarparticipante(ModelMap model, HttpSession session) {
        int idQuiniela = Integer.parseInt(session.getAttribute("sessionIDQuiniela").toString());
        model.addAttribute("jugadores", quinielaService.getjugadoresActual(idQuiniela));

        return "admin/eliminarparticipante";
    }

    @RequestMapping("/admin/eliminarjugador")
    public String eliminarparticipantesave(ModelMap model, @RequestParam String id) {

        //System.out.println("id jugador: " + id);
        quinielaService.eliminarJugador("" + id);

        return "redirect:/admin/eliminarparticipante";
    }

    @RequestMapping("/admin/editarquiniela")
    public String editar(@ModelAttribute Quiniela quiniela, @RequestParam String id, ModelMap model, HttpSession session) {
        session.setAttribute("sessionIDQuiniela", id);
        //  System.out.println("id Quinielaaaaaaaaaaaaaaaaaaa   xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx   = " + id);
        quiniela = quinielaService.getQuiniela(Integer.parseInt(id));

        model.addAttribute("quiniela", quiniela);

        return "admin/editarquiniela";
    }

    @RequestMapping("/admin/updatequiniela")
    public String updatequiniela(@ModelAttribute Quiniela quiniela, ModelMap model) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        SimpleDateFormat output = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        try {
            Date d;
            d = sdf.parse(quiniela.getFechaTemporal());
            Timestamp timeStampDate = new Timestamp(d.getTime());
            quiniela.setFechaLimite(timeStampDate);
        } catch (Exception ex) {
            // Logger.getLogger(QuinielaController.class.getName()).log(Level.SEVERE, null, ex);
        }

        quinielaService.updatequiniela(quiniela);

        return "redirect:/admin";
    }

    private Quiniela getDummyPartidosLista() {
        List<Partidos> personList = new LinkedList<Partidos>();
        for (int i = 0; i < 9; i++) {
            personList.add(new Partidos("", ""));
        }
        return new Quiniela(personList);
    }

    @RequestMapping("/admin/quinielas")
    public String quinielas(ModelMap model) {
        model.addAttribute("quiniela", quinielaService.getQuinielas());
        return "admin/listaQuinielas";
    }

    @RequestMapping("/admin/grupos")
    public String grupos(ModelMap model) {
        model.addAttribute("grupos", quinielaService.getPaginas());
        return "admin/grupos";

    }

    @RequestMapping("/admin/formulariocambiarclavegrupoadmin")
    public String formChangePasswordAdmin(ModelMap model, @RequestParam String nombre) {

        Users user = quinielaService.findByUserName(nombre);
        model.addAttribute("user", user);
        return "/admin/cambiarClaveadmin";
    }

    @RequestMapping("/admin/cambiarclaveadmin")
    public String ChangePasswordAdmin(@ModelAttribute Users user, ModelMap model, HttpSession session) {
        // System.out.println("adminfffs " + user.getUsername() + "  " + user.getPassword() + user.isEnabled());
        quinielaService.updateUser(user);
        return "redirect:/admin/grupos";
    }

    @RequestMapping("/admin/formchangepassword")
    public String formchangepassword(ModelMap model) {
        Users user = quinielaService.findByUserName(getUserActual());
        model.addAttribute("user", user);
        return "admin/formchangepassword";

    }

    @RequestMapping("/admin/changepassword")
    public String changepassword(@ModelAttribute Users user, ModelMap model) {

        quinielaService.updateUser(user);
        // System.out.println("namesssss: " + user.getUsername());
        return "redirect:/admin";

    }

    public String getUserActual() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        return username;
    }

    @RequestMapping("/admin/tabla")
    public String formTablaGeneral(ModelMap model) {
        System.out.println("CALCULANDO TABLA GENERAL ..........");
         model.addAttribute("liga", new EstadisticaTorneo());
          model.addAttribute("ligas", quinielaService.getLigas());
//        int idLiga = 30;
//        quinielaService.saveClubTablaGeneral(idLiga);

        return "/admin/tablageneral";
    }
    @RequestMapping("/admin/calctablageneral")
    public String calcularTablaGeneral(ModelMap model, @ModelAttribute EstadisticaTorneo estadisticaTorneo) {
        
        int idLiga = estadisticaTorneo.getId();
        quinielaService.saveClubTablaGeneral(idLiga);

        return "redirect:/admin";
    }

}
