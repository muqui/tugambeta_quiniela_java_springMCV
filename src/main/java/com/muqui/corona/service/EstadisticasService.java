/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.muqui.corona.service;

import com.muqui.corona.model.EstadisticaEquipo;
import com.muqui.corona.model.EstadisticaPartido;
import com.muqui.corona.model.Estadisticas;
import java.util.List;



/**
 *
 * @author mq12
 */
public interface EstadisticasService {
     public  Estadisticas getEstadsiticas(Estadisticas estadisticas);

    public Object getLigas();

    public String estadisticaSavePartido(EstadisticaPartido contact);

    public List<EstadisticaEquipo> getEquipos();
}
