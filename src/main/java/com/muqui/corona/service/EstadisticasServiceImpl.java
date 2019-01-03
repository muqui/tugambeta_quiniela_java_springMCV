/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.muqui.corona.service;

import com.muqui.corona.dao.EstadisticaDao;
import com.muqui.corona.model.EstadisticaEquipo;
import com.muqui.corona.model.EstadisticaPartido;
import com.muqui.corona.model.EstadisticaTorneo;
import com.muqui.corona.model.Estadisticas;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author mq12
 */
@Service("estadisticasService")
@Transactional
public class EstadisticasServiceImpl implements EstadisticasService {

    @Autowired
    private EstadisticaDao estadisticaDao;

    public  Estadisticas getEstadsiticas(Estadisticas estadisticas) {
      return  estadisticaDao.getEstadsiticas(estadisticas);
    }

    public List<EstadisticaTorneo>  getLigas() {
       return estadisticaDao.getLigas();
    }

    public String estadisticaSavePartido(EstadisticaPartido contact) {
      return  estadisticaDao. estadisticaSavePartido(contact);
    }

    public List<EstadisticaEquipo> getEquipos() {
      return  estadisticaDao.getEquipos();
      
    }

}
