/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.muqui.corona.controller;

import com.muqui.corona.model.Partidos;
import com.muqui.corona.model.Users;
import com.muqui.corona.service.QuinielaService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.HttpStatusCodeException;

/**
 *
 * @author mq12
 */
@RestController
public class ServidorRest {  
    @Autowired
    QuinielaService quinielaService;
     /*
     GET partidos   
     */
    @RequestMapping(value = "/rest/partidos/{grupo}", method = RequestMethod.GET)
    public ResponseEntity<List<Partidos>> listAllUsers(@PathVariable("grupo") String grupo) {
        List<Partidos> partidos = quinielaService.getPartidos(grupo);
        if (partidos.isEmpty()) {
            return new ResponseEntity<List<Partidos>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
        }
        return new ResponseEntity<List<Partidos>>(partidos, HttpStatus.OK);
    }
   @RequestMapping(value = "/rest/user/{id}", method = RequestMethod.GET)
    public ResponseEntity<Users> getUser(@PathVariable("id") String id) {
        System.out.println("Fetching User with id " + id);
        Users user =quinielaService.findByUserName(id);
       
        
        if (user == null) {
            System.out.println("User with id " + id + " not found");
            return new ResponseEntity<Users>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Users>(user, HttpStatus.OK);
    } 

}
