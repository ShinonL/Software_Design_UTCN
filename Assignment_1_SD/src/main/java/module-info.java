module sd.assignment_1_sd {
    requires javafx.controls;
    requires javafx.fxml;
    requires javafx.web;

    requires org.controlsfx.controls;
    requires com.dlsc.formsfx;
    requires validatorfx;
    requires org.kordamp.ikonli.javafx;
    requires org.kordamp.bootstrapfx.core;
    requires eu.hansolo.tilesfx;
    requires javafx.graphics;
    requires java.persistence;
    requires lombok;
    requires org.hibernate.orm.core;
    requires mysql.connector.java;
    requires java.sql;

    opens sd.assignment_1_sd to javafx.fxml;
    opens sd.assignment_1_sd.controller to javafx.fxml;
    opens sd.assignment_1_sd.entity to org.hibernate.orm.core, javafx.base;
    opens sd.assignment_1_sd.dto to javafx.base;
    exports sd.assignment_1_sd;
    exports sd.assignment_1_sd.controller;
    exports sd.assignment_1_sd.entity;
}