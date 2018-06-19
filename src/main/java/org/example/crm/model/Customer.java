package org.example.crm.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.util.Date;

@Entity
@Table(name = "customer")
public class Customer {

	@Id
	@Column(name = "id", updatable = false, nullable = false)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "customer_id_seq")
	@SequenceGenerator(name = "customer_id_seq", sequenceName = "customer_id_seq", allocationSize = 1)
	private Long id;

	@Column(name = "first_name")
	@NotNull(message = "Field required!")
	private String firstName;

	@Column(name = "last_name")
	@NotNull(message = "Field required!")
	private String lastName;

	@Column(name = "date_birth")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@NotNull(message = "Field required!")
	private Date dateOfBirth;

	@Column(name = "email")
	@Pattern(regexp = "^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$", message = "Incorrect email address!")
	@NotNull(message = "Field required!")
	private String email;

	@Column(name = "phone")
	@Pattern(regexp = "\\+{0,1}[- 0-9]+", message = "Incorrect phone number!")
	@NotNull(message = "Field required!")
	private String phone;

	public Customer() {
	}

	public Customer(@NotNull(message = "required") String firstName,
					@NotNull(message = "required") String lastName,
					@NotNull(message = "required") Date dateOfBirth,
					@NotNull(message = "required") String email,
					@NotNull(message = "required") String phone) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.dateOfBirth = dateOfBirth;
		this.email = email;
		this.phone = phone;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "Customer{" +
				"firstName='" + firstName + '\'' +
				", lastName='" + lastName + '\'' +
				'}';
	}
}
