package com.codingdojo.familyconnect.configs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.servlet.util.matcher.MvcRequestMatcher;
import org.springframework.web.servlet.handler.HandlerMappingIntrospector;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig {
	
	
	
    public WebSecurityConfig() {
		
	}

	@Autowired
    HandlerMappingIntrospector introspector;
	
	public UserDetailsService userDetailsService;

    @Bean
    protected BCryptPasswordEncoder bCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
    
    @Bean
    protected SecurityFilterChain filterChain(HttpSecurity http) throws Exception{		
    	http
    		.authorizeHttpRequests(
    			auth -> auth.requestMatchers(
    				new MvcRequestMatcher(introspector, "/admin/**")
    				).hasRole("ADMIN")
    			.requestMatchers(
    				new MvcRequestMatcher(introspector, "/"),
    				new MvcRequestMatcher(introspector, "/home")
    				).authenticated()
    			.anyRequest().permitAll()
    			)
				.formLogin(
				  form -> form.loginPage("/login")
				  .defaultSuccessUrl("/home")
				  .permitAll()
				  )
				.logout(
					logout -> logout.permitAll()
				);
    	return http.build();
    }
    
    protected void configure(HttpSecurity http) throws Exception {
        http
                .sessionManagement(management -> management
                        .maximumSessions(1)
                        .expiredUrl("/login?expired"));
    }

    
    
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(bCryptPasswordEncoder());
    }
    
    public HandlerMappingIntrospector getIntrospector() {
		return introspector;
	}

	public void setIntrospector(HandlerMappingIntrospector introspector) {
		this.introspector = introspector;
	}

	public UserDetailsService getUserDetailsService() {
		return userDetailsService;
	}

	public void setUserDetailsService(UserDetailsService userDetailsService) {
		this.userDetailsService = userDetailsService;
	}
}
