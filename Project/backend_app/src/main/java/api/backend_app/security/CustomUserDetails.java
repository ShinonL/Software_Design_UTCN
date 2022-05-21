package api.backend_app.security;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import api.backend_app.common.enums.Role;
import api.backend_app.entities.User;

import java.util.Arrays;
import java.util.Collection;

public class CustomUserDetails implements UserDetails {
    private User user;

    public CustomUserDetails(User user) {
        this.user = user;
    }
    public CustomUserDetails() { }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        if(user.getRole().equals(Role.ROLE_CUSTOMER))
            return Arrays.asList(new SimpleGrantedAuthority("ROLE_CUSTOMER"));
        return Arrays.asList(new SimpleGrantedAuthority("ROLE_EMPLOYEE"));
    }

    public boolean isEmployee() {
        return user.getRole().equals(Role.ROLE_EMPLOYEE);
    }

    public boolean isCustomer() {
        return user.getRole().equals(Role.ROLE_CUSTOMER);
    }

    public User getUser() {
        return user;
    }

    @Override
    public String getPassword() {
        return user.getPassword();
    }

    @Override
    public String getUsername() {
        return user.getUsername();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}