package org.example.crm.dao;

import org.example.crm.model.Customer;
import java.util.List;

public interface CustomerDAO {

	List<Customer> findAll();
}
