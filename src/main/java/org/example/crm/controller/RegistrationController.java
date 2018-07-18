package org.example.crm.controller;

import org.example.crm.user.CrmUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/register")
public class RegistrationController {

	@Autowired
	private UserDetailsManager userDetailsManager;

	private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();


	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		boolean trimToNull = true;
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(trimToNull);
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}

	@GetMapping("/registrationForm")
	public String registrationPage(Model theModel) {
		theModel.addAttribute("crmUser", new CrmUser());

		return "registration-form";
	}

	@PostMapping("/processRegistrationForm")
	public String processRegistrationForm(
			@Valid @ModelAttribute("crmUser") CrmUser crmUser,
			BindingResult theBindingResult,
			Model theModel) {

		String userName = crmUser.getUserName();

		if(theBindingResult.hasErrors()) {
			theModel.addAttribute("crmUser", new CrmUser());
			theModel.addAttribute("registrationError", "User name/password can not be empty.");

			return "registration-form";
		}

		if(userExists(userName)) {
			theModel.addAttribute("crmUser", new CrmUser());
			theModel.addAttribute("registrationError", "User name already exists.");

			return "registration-form";
		}

		String encodedPassword = passwordEncoder.encode(crmUser.getPassword());

		encodedPassword = "{bcrypt}" + encodedPassword;

		// give user default role of "employee"
		List<GrantedAuthority> authorities = AuthorityUtils.createAuthorityList("ROLE_EMPLOYEE");

		// create user object (from Spring Security framework)
		User tempUser = new User(userName, encodedPassword, authorities);

		// save user in the database
		userDetailsManager.createUser(tempUser);

		return "registration-confirmation";
	}

	private boolean userExists(String userName) {
		return userDetailsManager.userExists(userName);
	}

}