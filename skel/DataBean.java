/*
 */
package com.eccad2.bean;

import com.eccad2.connect.Securite;
import com.eccad2.help.Mail;
import com.eccad2.help.PreferencesManager;
import java.io.Serializable;
import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.context.FacesContext;
import org.hibernate.Session;

/**
 * @author rhitier
 */
@ManagedBean
@RequestScoped
public class DataBean implements Serializable {

    private List categories;
    private List sectors;
    private List variables;
    private List inventories;


    public DataBean() {
    }
}
