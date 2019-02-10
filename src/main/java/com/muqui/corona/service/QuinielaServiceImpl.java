/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.muqui.corona.service;

import com.muqui.corona.dao.QuinielaDao;
import com.muqui.corona.model.EstadisticaPartido;
import com.muqui.corona.model.EstadisticaTorneo;
import com.muqui.corona.model.Jugador;
import com.muqui.corona.model.Pagina;
import com.muqui.corona.model.Partidos;
import com.muqui.corona.model.Quiniela;
import com.muqui.corona.model.Tablageneral;
import com.muqui.corona.model.Users;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.security.access.method.P;
/**
 *
 * @author mq12
 */
@Service("quinielaService")
@Transactional
public class QuinielaServiceImpl implements QuinielaService {

    @Autowired
    private QuinielaDao dao;
    @Override
    public List<Partidos> getPartidos() {
        return dao.getPartidos();
    }

    @Override
    public Pagina getPagina() {
         return dao.getPagina();
    }

    @Override
    public Users findByUserName(String username) {
         return dao.findByUserName(username);
    }

    @Override
    public int jugar(Jugador jugador, String username) {
         return dao.jugar(jugador, username);
    }

   
    @Override
     public List<Partidos> getPartidos(String userId) {
       return dao.getPartidos(userId);
    }

    @Override
    public Pagina getPagina(String userId) {
      return dao.getPagina(userId);
    }

    @PreAuthorize("#pagina.nombre == authentication.name ")
    @Override
    public String rutaJugador(@P("pagina")Pagina pagina, String url) {
        if (isSubpagina(pagina)) {
            return url;
        } else {
            return "error";
        }
    }

    
    public boolean isSubpagina(Pagina pagina) {
        return dao.isSubpagina(pagina);
    }

    @Override
    public List<List<String>> getParticipantesSinLogin(Integer actual, String userId) {
        return dao.getParticipantesSinLogin(actual,userId);
    }

    @Override
   public Quiniela getQuiniela(int parseInt) {
       return  dao.getQuiniela(parseInt);
    }

    @Override
    public List<Partidos> getPartidos(int idquiniela) {
       return dao.getPartidos(idquiniela);
    }

    @Override
    public List<Quiniela> getQuinielasPagina(String userId) {
       return dao.getQuinielasPagina(userId);
    }

    @Override
    public List<Pagina> getPaginas(String userActual) {
      return dao.getPaginas(userActual);
    }

    @Override
    public Boolean findOneGruop(String username) {
      return dao.findOneGruop(username);
    }

    @Override
    public void addGrupo(Users user) {
        dao.addGrupo(user);
    }

    @Override
    public void updateUser(Users user) {
       dao.updateUser(user);
    }

    @Override
    public void saveQuiniela(Quiniela quiniela) {
       dao.saveQuiniela(quiniela);
    }

    @Override
    public List<Jugador> getjugadoresActualIdgrupo(int idGrupo) {
        return dao.getjugadoresActualIdgrupo(idGrupo);
    }

    @Override
    public void eliminarJugador(String string) {
       dao.eliminarJugador(string);
    }

    @Override
    public void setQuinielaActualGrupo(String id, String idGrupo) {
        dao.setQuinielaActualGrupo(id,idGrupo);
    }

    @Override
    public void updatequiniela(Quiniela quiniela, int idGrupo) {
       dao.updatequiniela(quiniela, idGrupo);
    }

    @Override
    public void setQuinielaActual(String id) {
        dao.setQuinielaActual(id);
    }

    @Override
    public Partidos getPartidoActualizar(String id) {
        return dao.getPartidoActualizar(id);
    }

    @Override
    public List<Jugador> getjugadoresActual(int idQuiniela) {
      return dao.getjugadoresActual(idQuiniela);
    }

    @Override
    public void actualizarResultado(Partidos partido, int idQuiniela) {
      dao.actualizarResultado(partido, idQuiniela);
    }

    @Override
    public void updatequiniela(Quiniela quiniela) {
        dao.updatequiniela(quiniela);
    }

    @Override
    public List<Quiniela> getQuinielas() {
      return dao.getQuinielas();
    }

    @Override
    public List<Pagina> getPaginas() {
      return dao.getPaginas();
    }

    @Override
    public Boolean findOneEmail(String email) {
        return dao.findOneEmail(email);
    }

    @Override
    public Boolean findOneUser(String username) {
       return dao.findOneUser(username);
    }

    @Override
    public void addUser(Users user) {
       dao.addUser(user);
    }

    @Override
    public Users findByUserEmail(String email) {
       return dao.findByUserEmail(email);
    }

    @Override
    public List<EstadisticaPartido> calcularTablaGeneral(int idLiga) {
       return dao.calcularTablaGeneral(idLiga);
    }

    @Override
    public void saveClubTablaGeneral(int idLiga) {
        dao.saveClubTablaGeneral(idLiga);
    }

    @Override
    public List<Tablageneral> getTablaGeneral() {
      return  dao.getTablaGeneral();
    }

    @Override
    public List<List<String>> getParticipantesSinLoginImprimir(Integer actual, String userId) {
       return dao.getParticipantesSinLoginImprimir(actual, userId);
    }

    @Override
    public  List<EstadisticaTorneo> getLigas() {
        return dao.getLigas();
    }

    @Override
    public String getnombreliga() {
        return dao.getnombreliga();
    }

    @Override
    public Pagina getPagina(int idPagina) {
      return dao.getPagina(idPagina);
    }

    @Override
    public void updatePagina(Pagina pagina) {
       dao.updatePagina(pagina);
    }

    @Override
    public List<Partidos> getPartidosIdGrupo(String idGrupo) {
        return dao.getPartidosIdGrupo(idGrupo);
    }

    @Override
    public void actualizarResultadoIdGrupo(Partidos partido, String idGrupo) {
       dao.actualizarResultadoIdGrupo(partido, idGrupo);
    }

    @Override
    public void eliminarGrupo(String nombre) {
        dao.eliminarGrupo(nombre);
    }

    @Override
    public boolean getEmail(String email) {
        return dao.getEmail(email);
    }

    @Override
    public boolean getUusername(String username) {
        return dao.getUusername(username);
    }

    
    

   
   
    
}
