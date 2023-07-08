package com.team2.finalproject.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.team2.finalproject.service.LoginIdPwValidator;

import lombok.RequiredArgsConstructor;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	
	private final LoginIdPwValidator loginIdPwValidator;
	

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
	

	/* 로그인 실패 핸들러 의존성 주입 */
	private final AuthenticationFailureHandler customFailureHandler;

	@Override
    protected void configure(HttpSecurity http) throws Exception {
        http
        .csrf().disable()
        .authorizeRequests()
        	.antMatchers("/main**", "/signUp**", "/notice**", "/login**").permitAll()
//        	.antMatchers("/admin").hasRole("Y")
            .anyRequest().authenticated()
        .and()
            .formLogin()
            .loginPage("/login")
            .usernameParameter("id")
            .passwordParameter("pw")
            .failureHandler(customFailureHandler) // 로그인 실패 핸들러
            .defaultSuccessUrl("/main", true)
            .permitAll()
        .and()
            .logout()
            .logoutRequestMatcher(new AntPathRequestMatcher("/logout"));
        

		//중복 로그인
        http.sessionManagement()
                .maximumSessions(1) //세션 최대 허용 수 
                .maxSessionsPreventsLogin(false); // false이면 중복 로그인하면 이전 로그인이 풀린다.
        
	}
	
    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/resources/assets/**","/resources/css/**","/resources/image/**","/resources/js/**");
    }

    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(loginIdPwValidator);
    }
}
