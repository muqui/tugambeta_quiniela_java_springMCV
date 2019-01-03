/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.muqui.corona.dao;

import com.muqui.corona.model.EstadisticaEquipo;
import com.muqui.corona.model.EstadisticaPartido;
import com.muqui.corona.model.EstadisticaTorneo;
import com.muqui.corona.model.Estadisticas;
import com.muqui.corona.model.Partidos;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
//

/**
 *
 * @author mq12
 */
@Repository("estadisticaDao")

public class EstadisticaDaoImpl implements EstadisticaDao {

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sf) {
        this.sessionFactory = sf;
    }

    public Estadisticas getEstadsiticas(Estadisticas estadisticas) {
        Estadisticas e = new Estadisticas();
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM EstadisticaPartido as partido  WHERE (partido.local= :local and partido.visita= :visita) OR (partido.local= :visita and partido.visita= :local) ORDER BY partido.fecha DESC ");
        query.setParameter("local", estadisticas.getLocal());
        query.setParameter("visita", estadisticas.getVisita());
        query.setMaxResults(10);
        List<EstadisticaPartido> list = query.list();
        int local = 0;
        int visita = 0;
        int empate = 0;
        String localC = estadisticas.getLocal();
        String visitaC = estadisticas.getVisita();
        for (EstadisticaPartido p : list) {
            if (p.getGoleslocal() > p.getGolesvisita()) {
                if (p.getLocal().equalsIgnoreCase(localC)) {
                    local++;
                }
                if (p.getLocal().equalsIgnoreCase(visitaC)) {
                    visita++;
                }

            }
            if (p.getGoleslocal() < p.getGolesvisita()) {
                if (p.getLocal().equalsIgnoreCase(localC)) {
                    visita++;
                }
                if (p.getLocal().equalsIgnoreCase(visitaC)) {
                    local++;
                }
            }
            if (p.getGoleslocal() == p.getGolesvisita()) {
                empate++;

            }
             
          //  System.out.println("M   U      Q     U      I     109    Local: " + p.getLocal() + "GOLES: " + p.getGoleslocal() + " visita: " + p.getVisita() + "GOLES: " + p.getGolesvisita());
            p.setTorneo(p.getEstadisticaTorneo().getNombre());
        }

        e.setLocalvsvisitalocal(local);
        e.setLocalvsvisitaempate(empate);
        e.setLocalvsvisitavisita(visita);

        System.out.println("from dao  LOCAL " + local + " VISITA " + visita + " EMPATE " + empate);

        query = session.createQuery("FROM EstadisticaPartido as partido  WHERE (partido.local= :local and partido.visita= :visita)  ORDER BY partido.fecha DESC ");
        query.setParameter("local", estadisticas.getLocal());
        query.setParameter("visita", estadisticas.getVisita());
        query.setMaxResults(10);
        List<EstadisticaPartido> list1 = query.list();
        local = 0;
        visita = 0;
        empate = 0;
        for (EstadisticaPartido p : list1) {
            if (p.getGoleslocal() > p.getGolesvisita()) {
                local++;
            }
            if (p.getGoleslocal() < p.getGolesvisita()) {
                visita++;
            }
            if (p.getGoleslocal() == p.getGolesvisita()) {
                empate++;
            }
         //   System.out.println("M   U      Q     U      I     solo local    Local: " + p.getLocal() + "GOLES: " + p.getGoleslocal() + " visita: " + p.getVisita() + "GOLES: " + p.getGolesvisita());
            p.setTorneo(p.getEstadisticaTorneo().getNombre());
        }
        e.setLocalvsvisitallocal(local);
        e.setLocalvsvisitalempate(empate);
        e.setLocalvsvisitalvisita(visita);

        //
        // ULTIMOS DIEZ PARTIDOS DEL LOCAL CONTRA TODOS.           EL LOCAL: tanto local como visante
        //
        local = 0;
        visita = 0;
        empate = 0;
        query = session.createQuery("FROM EstadisticaPartido as partido  WHERE (partido.local= :local OR partido.visita= :local)  ORDER BY partido.fecha DESC ");
        query.setParameter("local", estadisticas.getLocal());

        query.setMaxResults(10);
        List<EstadisticaPartido> list2 = query.list();

        for (EstadisticaPartido p : list2) {
            if (p.getGoleslocal() > p.getGolesvisita()) {
                if (p.getLocal().equalsIgnoreCase(localC) ) {
                    local++;
                }
                else{
                   visita++;
                }

            }
            if (p.getGoleslocal() < p.getGolesvisita()) {
                if (p.getVisita().equalsIgnoreCase(localC)) {
                    local++;
                }
                else{
                visita++;
                }
            }
            if (p.getGoleslocal() == p.getGolesvisita()) {
                empate++;

            }
            
         //   System.out.println("M   U      Q     U      I      localvstodos    Local: " + p.getLocal() + " GOLES: " + p.getGoleslocal() + " visita: " + p.getVisita() + " GOLES: " + p.getGolesvisita());
         //   System.out.println("local " + local + " vsiita " + visita + " empate " + empate);
            p.setTorneo(p.getEstadisticaTorneo().getNombre());
        }
        e.setLocalvstodoslocal(local);
        e.setLocalvstodosempate(empate);
        e.setLocalvstodosvisita(visita);

        //
        // ULTIMOS DIEZ PARTIDOS DEL LOCAL CONTRA TODOS.           muestra solo sus partidos de local
        //
          local = 0;
        visita = 0;
        empate = 0;
        query = session.createQuery("FROM EstadisticaPartido as partido  WHERE partido.local= :local  ORDER BY partido.fecha DESC ");
        query.setParameter("local", estadisticas.getLocal());

        query.setMaxResults(10);
        List<EstadisticaPartido> list3 = query.list();

        for (EstadisticaPartido p : list3) {
             if (p.getGoleslocal() > p.getGolesvisita()) {
                local++;
            }
            if (p.getGoleslocal() < p.getGolesvisita()) {
                visita++;
            }
            if (p.getGoleslocal() == p.getGolesvisita()) {
                empate++;
            }

          //  System.out.println("M   U      Q     U      I     solo local    Local: " + p.getLocal() + "GOLES: " + p.getGoleslocal() + " visita: " + p.getVisita() + "GOLES: " + p.getGolesvisita());
            p.setTorneo(p.getEstadisticaTorneo().getNombre());
        }
   e.setLocalvstodosllocal(local);
        e.setLocalvstodoslempate(empate);
        e.setLocalvstodoslvisita(visita);
        
         //
        // ULTIMOS DIEZ PARTIDOS DEL VISITA CONTRA TODOS.          
        //
          local = 0;
        visita = 0;
        empate = 0;
        query = session.createQuery("FROM EstadisticaPartido as partido  WHERE (partido.local= :visita OR partido.visita= :visita)  ORDER BY partido.fecha DESC ");
        query.setParameter("visita", estadisticas.getVisita());

        query.setMaxResults(10);
        List<EstadisticaPartido> list4 = query.list();

        for (EstadisticaPartido p : list4) {
              if (p.getGoleslocal() > p.getGolesvisita()) {
                if (p.getLocal().equalsIgnoreCase(visitaC) ) {
                    visita++;
                }
                else{
                   local++;
                }

            }
            if (p.getGoleslocal() < p.getGolesvisita()) {
                if (p.getVisita().equalsIgnoreCase(visitaC)) {
                    visita++;
                }
                else{
                local++;
                }
            }
            if (p.getGoleslocal() == p.getGolesvisita()) {
                empate++;

            } 

           // System.out.println("M   U      Q     U      I     solo visita visita    Local: " + p.getLocal() + "GOLES: " + p.getGoleslocal() + " visita: " + p.getVisita() + "GOLES: " + p.getGolesvisita());
            p.setTorneo(p.getEstadisticaTorneo().getNombre());
        }
        e.setVisitavstodoslocal(local);
        e.setVisitavstodosvisita(visita);
        e.setVisitavstodosempate(empate);
        
        
         //
        // ULTIMOS DIEZ PARTIDOS DEL LOCAL CONTRA TODOS.           muestra solo sus partidos de local
        //
          local = 0;
        visita = 0;
        empate = 0;
        query = session.createQuery("FROM EstadisticaPartido as partido  WHERE partido.visita= :visita  ORDER BY partido.fecha DESC ");
        query.setParameter("visita", estadisticas.getVisita());

        query.setMaxResults(10);
        List<EstadisticaPartido> list5 = query.list();

        for (EstadisticaPartido p : list5) {
             if (p.getGoleslocal() > p.getGolesvisita()) {
                local++;
            }
            if (p.getGoleslocal() < p.getGolesvisita()) {
                visita++;
            }
            if (p.getGoleslocal() == p.getGolesvisita()) {
                empate++;
            }

            System.out.println("M   U      Q     U      I    visita de visita   Local: " + p.getLocal() + "GOLES: " + p.getGoleslocal() + " visita: " + p.getVisita() + "GOLES: " + p.getGolesvisita());
            p.setTorneo(p.getEstadisticaTorneo().getNombre());
        }
   
           e.setVisitavstodosvlocal(local);
        e.setVisitavstodosvvisita(visita);
        e.setVisitavstodosvempate(empate);
        
        
        
        
        e.setLocal(estadisticas.getLocal());
        e.setVisita(estadisticas.getVisita());
        e.setLocalvsvisita(list);
        e.setLocalvsvisital(list1);
        e.setLocalvstodos(list2);
        e.setLocalvstodosl(list3);
        e.setVisitavstodos(list4);
        e.setVisitavstodosv(list5);
        
        return e;

    }
    public List<EstadisticaTorneo> getLigas() {
    
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM EstadisticaTorneo");
       
      
        List<EstadisticaTorneo> estadisticaTorneo = query.list();
        return estadisticaTorneo;
    }

    public String estadisticaSavePartido(EstadisticaPartido contact) {
          String retorno = "Listo";
        try {
           
         
            Session session = this.sessionFactory.getCurrentSession();
            Date fecha;
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            fecha = df.parse(contact.getFechaCadena());
            contact.setEstadisticaTorneo(getTorneo(contact.getTorneo()));
            contact.setFecha(fecha);
              System.out.println("date  fecha : estadisticas " + contact.getFecha() + " bolean  "  + isPartidoInsertado(contact.getLocal(), contact.getVisita(), contact.getFecha()));
            if(isPartidoInsertado(contact.getLocal(), contact.getVisita(), contact.getFecha())){
             session.persist(contact);
            retorno = contact.getFechaCadena() +  " Partido insertado" + contact.getLocal() +" " +contact.getGoleslocal() + " - " + contact.getGolesvisita() +" "+ contact.getVisita() ;
        
            }
            else{
                  retorno = "registro existente";
            }
             } catch (ParseException ex) {
            System.out.println("erororrwererrerer: " + ex);
            retorno = "Error: "+ex;
            Logger.getLogger(EstadisticaDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return retorno;
    }
    
    
    public EstadisticaTorneo getTorneo(String id) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM EstadisticaTorneo as torneo WHERE torneo.id =" + id);
        List<?> list = query.list();
        EstadisticaTorneo u = (EstadisticaTorneo) list.get(0);
        return u;
    }
     public boolean  isPartidoInsertado(String local, String visita, Date fecha) {
        Session session = this.sessionFactory.getCurrentSession();
       Query query = session.createQuery("FROM EstadisticaPartido as partido WHERE partido.local= :local and  partido.visita= :visita and partido.fecha= :fecha");
        query.setParameter("local", local);
        query.setParameter("visita", visita);
        query.setParameter("fecha", fecha);
        List<?> list = query.list();
         System.out.println("Lista valor tama�ao " +  list.size());
       if(list.isEmpty()){
        return true;
       }
       else{
        return false;
       }
        
    }
      public List<EstadisticaEquipo> getEquipos() {
    
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM EstadisticaEquipo");
       
          System.out.println(" Query query = session.createQuery(\"FROM EstadisticaEquipo\");");
        List<EstadisticaEquipo> estadisticaEquipo = query.list();
        
        
        for (EstadisticaEquipo p : estadisticaEquipo) {
            System.out.println("Autcompeltar nombre from constructor " + p.getNombre());
            System.out.println("Autocompletar ID " + p.getId());
        }
        return estadisticaEquipo;
    }
}
