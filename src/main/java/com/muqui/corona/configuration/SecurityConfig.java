/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.muqui.corona.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    @Qualifier("userDetailsService")
    UserDetailsService userDetailsService;

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
       //       auth.userDetailsService(userDetailsService);
    }
  
 

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable();
        http.authorizeRequests()
        
                 .antMatchers("/admin/**").access("hasRole('ROLE_ADMIN') ")
                .antMatchers("/admingrupo/**").access("hasRole('ROLE_ADMIN') or hasRole('ROLE_ADMIN_GRUPO')")
                .antMatchers("/entrar").access("hasRole('ROLE_ADMIN') or hasRole('ROLE_ADMIN_GRUPO') or hasRole('ROLE_JUGADOR')")
                .antMatchers("/guardar").access("hasRole('ROLE_ADMIN') or hasRole('ROLE_ADMIN_GRUPO') or hasRole('ROLE_JUGADOR')")
                .antMatchers("/resultadosestadistica").access("hasRole('ROLE_ADMIN')")
                .antMatchers("/quiniela/*/jugar").access("hasRole('ROLE_ADMIN') or hasRole('ROLE_ADMIN_GRUPO') or hasRole('ROLE_JUGADOR') ")
                .and().formLogin()
                .loginPage("/login").failureUrl("/login?error")
                .usernameParameter("username")
                .passwordParameter("password")
                .and().logout().logoutSuccessUrl("/")
                
                .and().exceptionHandling().accessDeniedPage("/403");

    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        PasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder;
    }
    
//    @Bean
//	public CustomBasicAuthenticationEntryPoint getBasicAuthEntryPoint(){
//		return new CustomBasicAuthenticationEntryPoint();
//	}
    
       @Override
public void configure(WebSecurity web) throws Exception {
//     web.ignoring().antMatchers(HttpMethod.OPTIONS, "/quiniela/*/historial")
//             .antMatchers(HttpMethod.OPTIONS, "/quiniela/*/participantes");
 web.ignoring().antMatchers(HttpMethod.OPTIONS, "/quiniela/*/historial", "/quiniela/*/participantes");
}
//    

}
