package sd.assignment.backend_app.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.servlet.config.annotation.CorsRegistry;

@EnableWebSecurity
public class WebAppConfig extends WebSecurityConfigurerAdapter {
    private final CustomAuthenticationSuccess customAuthenticationSucces;

    @Autowired
    private CustomDetailsService customDetailsService;

    @Autowired
    private UserDetailsService userDetailsService;

    public WebAppConfig(CustomAuthenticationSuccess customAuthenticationSucces) {
        this.customAuthenticationSucces = customAuthenticationSucces;
    }

    @Override
    protected void configure(final AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService);
    }

    @Override
    protected void configure(final HttpSecurity http) throws Exception {
        http.cors()
            .and()
            .csrf()
            .disable()
            .authorizeRequests()
//            .antMatchers("/**").permitAll()
            .antMatchers("/admin/**").hasRole("ADMINISTRATOR")
            .antMatchers("/customer/**").hasRole("CUSTOMER")
            .antMatchers("/auth/**", "/common/**").permitAll()
            .anyRequest()
            .authenticated()
            .and()
            .httpBasic();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
