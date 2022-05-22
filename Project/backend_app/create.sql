
    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` `boolean default false` not null,
        `adoption_date` date not null,
        `decription` varchar(255) not null,
        `rescue_date` date not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `completed` `boolean default false` not null,
        `date_time` datetime(6) not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        `health_reference` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        `pet_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` `nvarchar(max) default 'N/A'` not null,
        `observation` `nvarchar(max) default 'N/A'` not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` `integer default 0` not null,
        `text` `nvarchar(max) default 'N/A'` not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `service` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` `integer default 0` not null,
        `price` double precision not null,
        `score` `real default 0` not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `service_appointment` (
       `service_id` varchar(255) not null,
        `appointment_id` varchar(255) not null
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `adoption` 
       add constraint `FKnj4oxvdqwi67lwnix8jf4210b` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `appointment` 
       add constraint `FKe5m4nyc25ulwyfjh5jvb7yug5` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `health_reference` 
       add constraint `FK9d6adh2yrel96vhdps7h9d8rd` 
       foreign key (`health_reference`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlbelb744wokt374tjqo39c9oa` 
       foreign key (`pet_id`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlwg96qwwl94pl1433godpm9vm` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `result` 
       add constraint `FKfeebv8qqww3qv4vpn61gc07yo` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `review` 
       add constraint `FK4os5q7otpuj8p5ik0muqktr5i` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `service_appointment` 
       add constraint `FKqv16t5uhx4th5m6nyyv7olsnb` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `service_appointment` 
       add constraint `FKgvbnoohyx9e0598oxf3b9q4o6` 
       foreign key (`service_id`) 
       references `service` (`id`);

    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` `boolean default false` not null,
        `adoption_date` date not null,
        `decription` varchar(255) not null,
        `rescue_date` date not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `completed` `boolean default false` not null,
        `date_time` datetime(6) not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        `health_reference` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        `pet_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` `nvarchar(max) default 'N/A'` not null,
        `observation` `nvarchar(max) default 'N/A'` not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` `integer default 0` not null,
        `text` `nvarchar(max) default 'N/A'` not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `service` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` `integer default 0` not null,
        `price` double precision not null,
        `score` `real default 0` not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `service_appointment` (
       `service_id` varchar(255) not null,
        `appointment_id` varchar(255) not null
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `adoption` 
       add constraint `FKnj4oxvdqwi67lwnix8jf4210b` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `appointment` 
       add constraint `FKe5m4nyc25ulwyfjh5jvb7yug5` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `health_reference` 
       add constraint `FK9d6adh2yrel96vhdps7h9d8rd` 
       foreign key (`health_reference`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlbelb744wokt374tjqo39c9oa` 
       foreign key (`pet_id`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlwg96qwwl94pl1433godpm9vm` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `result` 
       add constraint `FKfeebv8qqww3qv4vpn61gc07yo` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `review` 
       add constraint `FK4os5q7otpuj8p5ik0muqktr5i` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `service_appointment` 
       add constraint `FKqv16t5uhx4th5m6nyyv7olsnb` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `service_appointment` 
       add constraint `FKgvbnoohyx9e0598oxf3b9q4o6` 
       foreign key (`service_id`) 
       references `service` (`id`);

    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` `boolean default false` not null,
        `adoption_date` date not null,
        `decription` varchar(255) not null,
        `rescue_date` date not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `completed` `boolean default false` not null,
        `date_time` datetime(6) not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        `health_reference` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        `pet_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` `nvarchar(max) default 'N/A'` not null,
        `observation` `nvarchar(max) default 'N/A'` not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` `integer default 0` not null,
        `text` `nvarchar(max) default 'N/A'` not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `service` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` `integer default 0` not null,
        `price` double precision not null,
        `score` `real default 0` not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `service_appointment` (
       `service_id` varchar(255) not null,
        `appointment_id` varchar(255) not null
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `adoption` 
       add constraint `FKnj4oxvdqwi67lwnix8jf4210b` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `appointment` 
       add constraint `FKe5m4nyc25ulwyfjh5jvb7yug5` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `health_reference` 
       add constraint `FK9d6adh2yrel96vhdps7h9d8rd` 
       foreign key (`health_reference`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlbelb744wokt374tjqo39c9oa` 
       foreign key (`pet_id`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlwg96qwwl94pl1433godpm9vm` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `result` 
       add constraint `FKfeebv8qqww3qv4vpn61gc07yo` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `review` 
       add constraint `FK4os5q7otpuj8p5ik0muqktr5i` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `service_appointment` 
       add constraint `FKqv16t5uhx4th5m6nyyv7olsnb` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `service_appointment` 
       add constraint `FKgvbnoohyx9e0598oxf3b9q4o6` 
       foreign key (`service_id`) 
       references `service` (`id`);

    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` `boolean default false` not null,
        `adoption_date` date not null,
        `decription` varchar(255) not null,
        `rescue_date` date not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `completed` `boolean default false` not null,
        `date_time` datetime(6) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` `nvarchar(max) default 'N/A'` not null,
        `observation` `nvarchar(max) default 'N/A'` not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` `integer default 0` not null,
        `text` `nvarchar(max) default 'N/A'` not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `service` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` `integer default 0` not null,
        `price` double precision not null,
        `score` `real default 0` not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` bit not null,
        `adoption_date` date not null,
        `decription` varchar(255) not null,
        `rescue_date` date not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `completed` bit not null,
        `date_time` datetime(6) not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        `health_reference` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        `pet_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` varchar(255) not null,
        `observation` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` integer not null,
        `text` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `service` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` integer not null,
        `price` double precision not null,
        `score` double precision not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `service_appointment` (
       `service_id` varchar(255) not null,
        `appointment_id` varchar(255) not null
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `adoption` 
       add constraint `FKnj4oxvdqwi67lwnix8jf4210b` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `appointment` 
       add constraint `FKe5m4nyc25ulwyfjh5jvb7yug5` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `health_reference` 
       add constraint `FK9d6adh2yrel96vhdps7h9d8rd` 
       foreign key (`health_reference`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlbelb744wokt374tjqo39c9oa` 
       foreign key (`pet_id`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlwg96qwwl94pl1433godpm9vm` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `result` 
       add constraint `FKfeebv8qqww3qv4vpn61gc07yo` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `review` 
       add constraint `FK4os5q7otpuj8p5ik0muqktr5i` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `service_appointment` 
       add constraint `FKqv16t5uhx4th5m6nyyv7olsnb` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `service_appointment` 
       add constraint `FKgvbnoohyx9e0598oxf3b9q4o6` 
       foreign key (`service_id`) 
       references `service` (`id`);

    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` bit not null,
        `adoption_date` date not null,
        `decription` varchar(255) not null,
        `rescue_date` date not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `completed` bit not null,
        `date_time` datetime(6) not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        `health_reference` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        `pet_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` varchar(255) not null,
        `observation` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` integer not null,
        `text` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `service` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` integer not null,
        `price` double precision not null,
        `score` double precision not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `service_appointment` (
       `service_id` varchar(255) not null,
        `appointment_id` varchar(255) not null
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `adoption` 
       add constraint `FKnj4oxvdqwi67lwnix8jf4210b` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `appointment` 
       add constraint `FKe5m4nyc25ulwyfjh5jvb7yug5` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `health_reference` 
       add constraint `FK9d6adh2yrel96vhdps7h9d8rd` 
       foreign key (`health_reference`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlbelb744wokt374tjqo39c9oa` 
       foreign key (`pet_id`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlwg96qwwl94pl1433godpm9vm` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `result` 
       add constraint `FKfeebv8qqww3qv4vpn61gc07yo` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `review` 
       add constraint `FK4os5q7otpuj8p5ik0muqktr5i` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `service_appointment` 
       add constraint `FKqv16t5uhx4th5m6nyyv7olsnb` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `service_appointment` 
       add constraint `FKgvbnoohyx9e0598oxf3b9q4o6` 
       foreign key (`service_id`) 
       references `service` (`id`);

    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` bit not null,
        `adoption_date` date not null,
        `decription` varchar(255) not null,
        `rescue_date` date not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `completed` bit not null,
        `date_time` datetime(6) not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        `health_reference` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        `pet_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` varchar(255) not null,
        `observation` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` integer not null,
        `text` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `service` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` integer not null,
        `price` double precision not null,
        `score` double precision not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `service_appointment` (
       `service_id` varchar(255) not null,
        `appointment_id` varchar(255) not null
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `adoption` 
       add constraint `FKnj4oxvdqwi67lwnix8jf4210b` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `appointment` 
       add constraint `FKe5m4nyc25ulwyfjh5jvb7yug5` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `health_reference` 
       add constraint `FK9d6adh2yrel96vhdps7h9d8rd` 
       foreign key (`health_reference`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlbelb744wokt374tjqo39c9oa` 
       foreign key (`pet_id`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlwg96qwwl94pl1433godpm9vm` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `result` 
       add constraint `FKfeebv8qqww3qv4vpn61gc07yo` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `review` 
       add constraint `FK4os5q7otpuj8p5ik0muqktr5i` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `service_appointment` 
       add constraint `FKqv16t5uhx4th5m6nyyv7olsnb` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `service_appointment` 
       add constraint `FKgvbnoohyx9e0598oxf3b9q4o6` 
       foreign key (`service_id`) 
       references `service` (`id`);

    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` bit not null,
        `adoption_date` date not null,
        `description` varchar(255) not null,
        `rescue_date` date not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `completed` bit not null,
        `date_time` datetime(6) not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` integer not null,
        `price` double precision not null,
        `score` double precision not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility_appointment` (
       `facility_id` varchar(255) not null,
        `appointment_id` varchar(255) not null
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        `health_reference` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        `pet_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` varchar(255) not null,
        `observation` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` integer not null,
        `text` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `adoption` 
       add constraint `FKnj4oxvdqwi67lwnix8jf4210b` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `appointment` 
       add constraint `FKe5m4nyc25ulwyfjh5jvb7yug5` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `facility_appointment` 
       add constraint `FK952ou25fcfuhp2p0529ti7k0a` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `facility_appointment` 
       add constraint `FK6l3awywis2pl5o1rtnwfu2141` 
       foreign key (`facility_id`) 
       references `facility` (`id`);

    alter table `health_reference` 
       add constraint `FK9d6adh2yrel96vhdps7h9d8rd` 
       foreign key (`health_reference`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlbelb744wokt374tjqo39c9oa` 
       foreign key (`pet_id`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlwg96qwwl94pl1433godpm9vm` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `result` 
       add constraint `FKfeebv8qqww3qv4vpn61gc07yo` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `review` 
       add constraint `FK4os5q7otpuj8p5ik0muqktr5i` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` bit not null,
        `adoption_date` date not null,
        `description` varchar(255) not null,
        `rescue_date` date not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `completed` bit not null,
        `date_time` datetime(6) not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` integer not null,
        `price` double precision not null,
        `score` double precision not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility_appointment` (
       `facility_id` varchar(255) not null,
        `appointment_id` varchar(255) not null
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        `health_reference` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        `pet_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` varchar(255) not null,
        `observation` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` integer not null,
        `text` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `adoption` 
       add constraint `FKnj4oxvdqwi67lwnix8jf4210b` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `appointment` 
       add constraint `FKe5m4nyc25ulwyfjh5jvb7yug5` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `facility_appointment` 
       add constraint `FK952ou25fcfuhp2p0529ti7k0a` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `facility_appointment` 
       add constraint `FK6l3awywis2pl5o1rtnwfu2141` 
       foreign key (`facility_id`) 
       references `facility` (`id`);

    alter table `health_reference` 
       add constraint `FK9d6adh2yrel96vhdps7h9d8rd` 
       foreign key (`health_reference`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlbelb744wokt374tjqo39c9oa` 
       foreign key (`pet_id`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlwg96qwwl94pl1433godpm9vm` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `result` 
       add constraint `FKfeebv8qqww3qv4vpn61gc07yo` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `review` 
       add constraint `FK4os5q7otpuj8p5ik0muqktr5i` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` bit not null,
        `adoption_date` date not null,
        `description` varchar(255) not null,
        `rescue_date` date not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `completed` bit not null,
        `date_time` datetime(6) not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` integer not null,
        `price` double precision not null,
        `score` double precision not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility_appointment` (
       `facility_id` varchar(255) not null,
        `appointment_id` varchar(255) not null
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        `health_reference` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        `pet_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` varchar(255) not null,
        `observation` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` integer not null,
        `text` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `adoption` 
       add constraint `FKnj4oxvdqwi67lwnix8jf4210b` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `appointment` 
       add constraint `FKe5m4nyc25ulwyfjh5jvb7yug5` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `facility_appointment` 
       add constraint `FK952ou25fcfuhp2p0529ti7k0a` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `facility_appointment` 
       add constraint `FK6l3awywis2pl5o1rtnwfu2141` 
       foreign key (`facility_id`) 
       references `facility` (`id`);

    alter table `health_reference` 
       add constraint `FK9d6adh2yrel96vhdps7h9d8rd` 
       foreign key (`health_reference`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlbelb744wokt374tjqo39c9oa` 
       foreign key (`pet_id`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlwg96qwwl94pl1433godpm9vm` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `result` 
       add constraint `FKfeebv8qqww3qv4vpn61gc07yo` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `review` 
       add constraint `FK4os5q7otpuj8p5ik0muqktr5i` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` bit not null,
        `adoption_date` date not null,
        `description` varchar(255) not null,
        `rescue_date` date not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `completed` bit not null,
        `date_time` datetime(6) not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` integer not null,
        `price` double precision not null,
        `score` double precision not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility_appointment` (
       `facility_id` varchar(255) not null,
        `appointment_id` varchar(255) not null
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        `health_reference` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        `pet_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` varchar(255) not null,
        `observation` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` integer not null,
        `text` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `adoption` 
       add constraint `FKnj4oxvdqwi67lwnix8jf4210b` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `appointment` 
       add constraint `FKe5m4nyc25ulwyfjh5jvb7yug5` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `facility_appointment` 
       add constraint `FK952ou25fcfuhp2p0529ti7k0a` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `facility_appointment` 
       add constraint `FK6l3awywis2pl5o1rtnwfu2141` 
       foreign key (`facility_id`) 
       references `facility` (`id`);

    alter table `health_reference` 
       add constraint `FK9d6adh2yrel96vhdps7h9d8rd` 
       foreign key (`health_reference`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlbelb744wokt374tjqo39c9oa` 
       foreign key (`pet_id`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlwg96qwwl94pl1433godpm9vm` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `result` 
       add constraint `FKfeebv8qqww3qv4vpn61gc07yo` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `review` 
       add constraint `FK4os5q7otpuj8p5ik0muqktr5i` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` bit not null,
        `adoption_date` date not null,
        `description` varchar(255) not null,
        `rescue_date` date not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `completed` bit not null,
        `date_time` datetime(6) not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` integer not null,
        `price` double precision not null,
        `score` double precision not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility_appointment` (
       `facility_id` varchar(255) not null,
        `appointment_id` varchar(255) not null
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        `health_reference` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        `pet_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` varchar(255) not null,
        `observation` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` integer not null,
        `text` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `adoption` 
       add constraint `FKnj4oxvdqwi67lwnix8jf4210b` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `appointment` 
       add constraint `FKe5m4nyc25ulwyfjh5jvb7yug5` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `facility_appointment` 
       add constraint `FK952ou25fcfuhp2p0529ti7k0a` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `facility_appointment` 
       add constraint `FK6l3awywis2pl5o1rtnwfu2141` 
       foreign key (`facility_id`) 
       references `facility` (`id`);

    alter table `health_reference` 
       add constraint `FK9d6adh2yrel96vhdps7h9d8rd` 
       foreign key (`health_reference`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlbelb744wokt374tjqo39c9oa` 
       foreign key (`pet_id`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlwg96qwwl94pl1433godpm9vm` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `result` 
       add constraint `FKfeebv8qqww3qv4vpn61gc07yo` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `review` 
       add constraint `FK4os5q7otpuj8p5ik0muqktr5i` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` bit not null,
        `adoption_date` date not null,
        `description` varchar(255) not null,
        `rescue_date` date not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `completed` bit not null,
        `date_time` datetime(6) not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` integer not null,
        `price` double precision not null,
        `score` double precision not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility_appointment` (
       `facility_id` varchar(255) not null,
        `appointment_id` varchar(255) not null
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        `health_reference` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        `pet_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` varchar(255) not null,
        `observation` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` integer not null,
        `text` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `adoption` 
       add constraint `FKnj4oxvdqwi67lwnix8jf4210b` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `appointment` 
       add constraint `FKe5m4nyc25ulwyfjh5jvb7yug5` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `facility_appointment` 
       add constraint `FK952ou25fcfuhp2p0529ti7k0a` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `facility_appointment` 
       add constraint `FK6l3awywis2pl5o1rtnwfu2141` 
       foreign key (`facility_id`) 
       references `facility` (`id`);

    alter table `health_reference` 
       add constraint `FK9d6adh2yrel96vhdps7h9d8rd` 
       foreign key (`health_reference`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlbelb744wokt374tjqo39c9oa` 
       foreign key (`pet_id`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlwg96qwwl94pl1433godpm9vm` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `result` 
       add constraint `FKfeebv8qqww3qv4vpn61gc07yo` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `review` 
       add constraint `FK4os5q7otpuj8p5ik0muqktr5i` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` bit not null,
        `adoption_date` date not null,
        `description` varchar(255) not null,
        `rescue_date` date not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `completed` bit not null,
        `date_time` datetime(6) not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` integer not null,
        `price` double precision not null,
        `score` double precision not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility_appointment` (
       `facility_id` varchar(255) not null,
        `appointment_id` varchar(255) not null
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        `health_reference` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        `pet_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` varchar(255) not null,
        `observation` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` integer not null,
        `text` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `adoption` 
       add constraint `FKnj4oxvdqwi67lwnix8jf4210b` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `appointment` 
       add constraint `FKe5m4nyc25ulwyfjh5jvb7yug5` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `facility_appointment` 
       add constraint `FK952ou25fcfuhp2p0529ti7k0a` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `facility_appointment` 
       add constraint `FK6l3awywis2pl5o1rtnwfu2141` 
       foreign key (`facility_id`) 
       references `facility` (`id`);

    alter table `health_reference` 
       add constraint `FK9d6adh2yrel96vhdps7h9d8rd` 
       foreign key (`health_reference`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlbelb744wokt374tjqo39c9oa` 
       foreign key (`pet_id`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlwg96qwwl94pl1433godpm9vm` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `result` 
       add constraint `FKfeebv8qqww3qv4vpn61gc07yo` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `review` 
       add constraint `FK4os5q7otpuj8p5ik0muqktr5i` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` bit not null,
        `adoption_date` date not null,
        `description` varchar(255) not null,
        `rescue_date` date not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `completed` bit not null,
        `date_time` datetime(6) not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` integer not null,
        `price` double precision not null,
        `score` double precision not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility_appointment` (
       `facility_id` varchar(255) not null,
        `appointment_id` varchar(255) not null
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        `health_reference` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        `pet_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` varchar(255) not null,
        `observation` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` integer not null,
        `text` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `adoption` 
       add constraint `FKnj4oxvdqwi67lwnix8jf4210b` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `appointment` 
       add constraint `FKe5m4nyc25ulwyfjh5jvb7yug5` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `facility_appointment` 
       add constraint `FK952ou25fcfuhp2p0529ti7k0a` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `facility_appointment` 
       add constraint `FK6l3awywis2pl5o1rtnwfu2141` 
       foreign key (`facility_id`) 
       references `facility` (`id`);

    alter table `health_reference` 
       add constraint `FK9d6adh2yrel96vhdps7h9d8rd` 
       foreign key (`health_reference`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlbelb744wokt374tjqo39c9oa` 
       foreign key (`pet_id`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlwg96qwwl94pl1433godpm9vm` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `result` 
       add constraint `FKfeebv8qqww3qv4vpn61gc07yo` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `review` 
       add constraint `FK4os5q7otpuj8p5ik0muqktr5i` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` bit not null,
        `adoption_date` date not null,
        `description` varchar(255) not null,
        `rescue_date` date not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `appointment_state` varchar(255),
        `date_time` datetime(6) not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` integer not null,
        `price` double precision not null,
        `score` double precision not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility_appointment` (
       `facility_id` varchar(255) not null,
        `appointment_id` varchar(255) not null
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        `health_reference` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        `pet_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` varchar(255) not null,
        `observation` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` integer not null,
        `text` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `adoption` 
       add constraint `FKnj4oxvdqwi67lwnix8jf4210b` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `appointment` 
       add constraint `FKe5m4nyc25ulwyfjh5jvb7yug5` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `facility_appointment` 
       add constraint `FK952ou25fcfuhp2p0529ti7k0a` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `facility_appointment` 
       add constraint `FK6l3awywis2pl5o1rtnwfu2141` 
       foreign key (`facility_id`) 
       references `facility` (`id`);

    alter table `health_reference` 
       add constraint `FK9d6adh2yrel96vhdps7h9d8rd` 
       foreign key (`health_reference`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlbelb744wokt374tjqo39c9oa` 
       foreign key (`pet_id`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlwg96qwwl94pl1433godpm9vm` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `result` 
       add constraint `FKfeebv8qqww3qv4vpn61gc07yo` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `review` 
       add constraint `FK4os5q7otpuj8p5ik0muqktr5i` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` bit not null,
        `adoption_date` date not null,
        `description` varchar(255) not null,
        `rescue_date` date not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `appointment_state` varchar(255),
        `date_time` datetime(6) not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` integer not null,
        `price` double precision not null,
        `score` double precision not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility_appointment` (
       `facility_id` varchar(255) not null,
        `appointment_id` varchar(255) not null
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        `health_reference` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        `pet_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` varchar(255) not null,
        `observation` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` integer not null,
        `text` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `adoption` 
       add constraint `FKnj4oxvdqwi67lwnix8jf4210b` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `appointment` 
       add constraint `FKe5m4nyc25ulwyfjh5jvb7yug5` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `facility_appointment` 
       add constraint `FK952ou25fcfuhp2p0529ti7k0a` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `facility_appointment` 
       add constraint `FK6l3awywis2pl5o1rtnwfu2141` 
       foreign key (`facility_id`) 
       references `facility` (`id`);

    alter table `health_reference` 
       add constraint `FK9d6adh2yrel96vhdps7h9d8rd` 
       foreign key (`health_reference`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlbelb744wokt374tjqo39c9oa` 
       foreign key (`pet_id`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlwg96qwwl94pl1433godpm9vm` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `result` 
       add constraint `FKfeebv8qqww3qv4vpn61gc07yo` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `review` 
       add constraint `FK4os5q7otpuj8p5ik0muqktr5i` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` bit not null,
        `adoption_date` date not null,
        `description` varchar(255) not null,
        `rescue_date` date not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `appointment_state` varchar(255),
        `date_time` datetime(6) not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` integer not null,
        `price` double precision not null,
        `score` double precision not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility_appointment` (
       `facility_id` varchar(255) not null,
        `appointment_id` varchar(255) not null
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        `health_reference` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        `pet_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` varchar(255) not null,
        `observation` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` integer not null,
        `text` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `adoption` 
       add constraint `FKnj4oxvdqwi67lwnix8jf4210b` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `appointment` 
       add constraint `FKe5m4nyc25ulwyfjh5jvb7yug5` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `facility_appointment` 
       add constraint `FK952ou25fcfuhp2p0529ti7k0a` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `facility_appointment` 
       add constraint `FK6l3awywis2pl5o1rtnwfu2141` 
       foreign key (`facility_id`) 
       references `facility` (`id`);

    alter table `health_reference` 
       add constraint `FK9d6adh2yrel96vhdps7h9d8rd` 
       foreign key (`health_reference`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlbelb744wokt374tjqo39c9oa` 
       foreign key (`pet_id`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlwg96qwwl94pl1433godpm9vm` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `result` 
       add constraint `FKfeebv8qqww3qv4vpn61gc07yo` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `review` 
       add constraint `FK4os5q7otpuj8p5ik0muqktr5i` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` bit not null,
        `adoption_date` date not null,
        `description` varchar(255) not null,
        `rescue_date` date not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `appointment_state` varchar(255),
        `date_time` datetime(6) not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` integer not null,
        `price` double precision not null,
        `score` double precision not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility_appointment` (
       `facility_id` varchar(255) not null,
        `appointment_id` varchar(255) not null
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        `health_reference` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        `pet_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` varchar(255) not null,
        `observation` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` integer not null,
        `text` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `adoption` 
       add constraint `FKnj4oxvdqwi67lwnix8jf4210b` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `appointment` 
       add constraint `FKe5m4nyc25ulwyfjh5jvb7yug5` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `facility_appointment` 
       add constraint `FK952ou25fcfuhp2p0529ti7k0a` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `facility_appointment` 
       add constraint `FK6l3awywis2pl5o1rtnwfu2141` 
       foreign key (`facility_id`) 
       references `facility` (`id`);

    alter table `health_reference` 
       add constraint `FK9d6adh2yrel96vhdps7h9d8rd` 
       foreign key (`health_reference`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlbelb744wokt374tjqo39c9oa` 
       foreign key (`pet_id`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlwg96qwwl94pl1433godpm9vm` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `result` 
       add constraint `FKfeebv8qqww3qv4vpn61gc07yo` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `review` 
       add constraint `FK4os5q7otpuj8p5ik0muqktr5i` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` bit not null,
        `adoption_date` date not null,
        `description` varchar(255) not null,
        `rescue_date` date not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `appointment_state` varchar(255),
        `date_time` datetime(6) not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` integer not null,
        `price` double precision not null,
        `score` double precision not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility_appointment` (
       `facility_id` varchar(255) not null,
        `appointment_id` varchar(255) not null
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        `health_reference` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        `pet_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` varchar(255) not null,
        `observation` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` integer not null,
        `text` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `adoption` 
       add constraint `FKnj4oxvdqwi67lwnix8jf4210b` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `appointment` 
       add constraint `FKe5m4nyc25ulwyfjh5jvb7yug5` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `facility_appointment` 
       add constraint `FK952ou25fcfuhp2p0529ti7k0a` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `facility_appointment` 
       add constraint `FK6l3awywis2pl5o1rtnwfu2141` 
       foreign key (`facility_id`) 
       references `facility` (`id`);

    alter table `health_reference` 
       add constraint `FK9d6adh2yrel96vhdps7h9d8rd` 
       foreign key (`health_reference`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlbelb744wokt374tjqo39c9oa` 
       foreign key (`pet_id`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlwg96qwwl94pl1433godpm9vm` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `result` 
       add constraint `FKfeebv8qqww3qv4vpn61gc07yo` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `review` 
       add constraint `FK4os5q7otpuj8p5ik0muqktr5i` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` bit not null,
        `adoption_date` date not null,
        `description` varchar(255) not null,
        `rescue_date` date not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `appointment_state` varchar(255),
        `date_time` datetime(6) not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` integer not null,
        `price` double precision not null,
        `score` double precision not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility_appointment` (
       `facility_id` varchar(255) not null,
        `appointment_id` varchar(255) not null
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        `health_reference` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        `pet_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` varchar(255) not null,
        `observation` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` integer not null,
        `text` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `adoption` 
       add constraint `FKnj4oxvdqwi67lwnix8jf4210b` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `appointment` 
       add constraint `FKe5m4nyc25ulwyfjh5jvb7yug5` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `facility_appointment` 
       add constraint `FK952ou25fcfuhp2p0529ti7k0a` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `facility_appointment` 
       add constraint `FK6l3awywis2pl5o1rtnwfu2141` 
       foreign key (`facility_id`) 
       references `facility` (`id`);

    alter table `health_reference` 
       add constraint `FK9d6adh2yrel96vhdps7h9d8rd` 
       foreign key (`health_reference`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlbelb744wokt374tjqo39c9oa` 
       foreign key (`pet_id`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlwg96qwwl94pl1433godpm9vm` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `result` 
       add constraint `FKfeebv8qqww3qv4vpn61gc07yo` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `review` 
       add constraint `FK4os5q7otpuj8p5ik0muqktr5i` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` bit not null,
        `adoption_date` date not null,
        `description` varchar(255) not null,
        `rescue_date` date not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `appointment_state` varchar(255),
        `date_time` datetime(6) not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` integer not null,
        `price` double precision not null,
        `score` double precision not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility_appointment` (
       `facility_id` varchar(255) not null,
        `appointment_id` varchar(255) not null
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        `health_reference` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        `pet_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` varchar(255) not null,
        `observation` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` integer not null,
        `text` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `adoption` 
       add constraint `FKnj4oxvdqwi67lwnix8jf4210b` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `appointment` 
       add constraint `FKe5m4nyc25ulwyfjh5jvb7yug5` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `facility_appointment` 
       add constraint `FK952ou25fcfuhp2p0529ti7k0a` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `facility_appointment` 
       add constraint `FK6l3awywis2pl5o1rtnwfu2141` 
       foreign key (`facility_id`) 
       references `facility` (`id`);

    alter table `health_reference` 
       add constraint `FK9d6adh2yrel96vhdps7h9d8rd` 
       foreign key (`health_reference`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlbelb744wokt374tjqo39c9oa` 
       foreign key (`pet_id`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlwg96qwwl94pl1433godpm9vm` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `result` 
       add constraint `FKfeebv8qqww3qv4vpn61gc07yo` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `review` 
       add constraint `FK4os5q7otpuj8p5ik0muqktr5i` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` bit not null,
        `adoption_date` date not null,
        `description` varchar(255) not null,
        `rescue_date` date not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `appointment_state` varchar(255),
        `date_time` datetime(6) not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` integer not null,
        `price` double precision not null,
        `score` double precision not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility_appointment` (
       `facility_id` varchar(255) not null,
        `appointment_id` varchar(255) not null
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        `health_reference` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        `pet_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` varchar(255) not null,
        `observation` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` integer not null,
        `text` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `adoption` 
       add constraint `FKnj4oxvdqwi67lwnix8jf4210b` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `appointment` 
       add constraint `FKe5m4nyc25ulwyfjh5jvb7yug5` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `facility_appointment` 
       add constraint `FK952ou25fcfuhp2p0529ti7k0a` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `facility_appointment` 
       add constraint `FK6l3awywis2pl5o1rtnwfu2141` 
       foreign key (`facility_id`) 
       references `facility` (`id`);

    alter table `health_reference` 
       add constraint `FK9d6adh2yrel96vhdps7h9d8rd` 
       foreign key (`health_reference`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlbelb744wokt374tjqo39c9oa` 
       foreign key (`pet_id`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlwg96qwwl94pl1433godpm9vm` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `result` 
       add constraint `FKfeebv8qqww3qv4vpn61gc07yo` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `review` 
       add constraint `FK4os5q7otpuj8p5ik0muqktr5i` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` bit not null,
        `adoption_date` date not null,
        `description` varchar(255) not null,
        `rescue_date` date not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `appointment_state` varchar(255),
        `date_time` datetime(6) not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` integer not null,
        `price` double precision not null,
        `score` double precision not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility_appointment` (
       `facility_id` varchar(255) not null,
        `appointment_id` varchar(255) not null
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        `health_reference` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        `pet_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` varchar(255) not null,
        `observation` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` integer not null,
        `text` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `adoption` 
       add constraint `FKnj4oxvdqwi67lwnix8jf4210b` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `appointment` 
       add constraint `FKe5m4nyc25ulwyfjh5jvb7yug5` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `facility_appointment` 
       add constraint `FK952ou25fcfuhp2p0529ti7k0a` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `facility_appointment` 
       add constraint `FK6l3awywis2pl5o1rtnwfu2141` 
       foreign key (`facility_id`) 
       references `facility` (`id`);

    alter table `health_reference` 
       add constraint `FK9d6adh2yrel96vhdps7h9d8rd` 
       foreign key (`health_reference`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlbelb744wokt374tjqo39c9oa` 
       foreign key (`pet_id`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlwg96qwwl94pl1433godpm9vm` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `result` 
       add constraint `FKfeebv8qqww3qv4vpn61gc07yo` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `review` 
       add constraint `FK4os5q7otpuj8p5ik0muqktr5i` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` bit not null,
        `adoption_date` date not null,
        `description` varchar(255) not null,
        `rescue_date` date not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `appointment_state` varchar(255),
        `date_time` datetime(6) not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` integer not null,
        `price` double precision not null,
        `score` double precision not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility_appointment` (
       `facility_id` varchar(255) not null,
        `appointment_id` varchar(255) not null
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        `health_reference` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        `pet_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` varchar(255) not null,
        `observation` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` integer not null,
        `text` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `adoption` 
       add constraint `FKnj4oxvdqwi67lwnix8jf4210b` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `appointment` 
       add constraint `FKe5m4nyc25ulwyfjh5jvb7yug5` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `facility_appointment` 
       add constraint `FK952ou25fcfuhp2p0529ti7k0a` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `facility_appointment` 
       add constraint `FK6l3awywis2pl5o1rtnwfu2141` 
       foreign key (`facility_id`) 
       references `facility` (`id`);

    alter table `health_reference` 
       add constraint `FK9d6adh2yrel96vhdps7h9d8rd` 
       foreign key (`health_reference`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlbelb744wokt374tjqo39c9oa` 
       foreign key (`pet_id`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlwg96qwwl94pl1433godpm9vm` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `result` 
       add constraint `FKfeebv8qqww3qv4vpn61gc07yo` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `review` 
       add constraint `FK4os5q7otpuj8p5ik0muqktr5i` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` bit not null,
        `adoption_date` date not null,
        `description` varchar(255) not null,
        `rescue_date` date not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `appointment_state` varchar(255),
        `date_time` datetime(6) not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` integer not null,
        `price` double precision not null,
        `score` double precision not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility_appointment` (
       `facility_id` varchar(255) not null,
        `appointment_id` varchar(255) not null
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        `health_reference` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        `pet_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` varchar(255) not null,
        `observation` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` integer not null,
        `text` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `adoption` 
       add constraint `FKnj4oxvdqwi67lwnix8jf4210b` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `appointment` 
       add constraint `FKe5m4nyc25ulwyfjh5jvb7yug5` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `facility_appointment` 
       add constraint `FK952ou25fcfuhp2p0529ti7k0a` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `facility_appointment` 
       add constraint `FK6l3awywis2pl5o1rtnwfu2141` 
       foreign key (`facility_id`) 
       references `facility` (`id`);

    alter table `health_reference` 
       add constraint `FK9d6adh2yrel96vhdps7h9d8rd` 
       foreign key (`health_reference`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlbelb744wokt374tjqo39c9oa` 
       foreign key (`pet_id`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlwg96qwwl94pl1433godpm9vm` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `result` 
       add constraint `FKfeebv8qqww3qv4vpn61gc07yo` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `review` 
       add constraint `FK4os5q7otpuj8p5ik0muqktr5i` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` bit not null,
        `adoption_date` date not null,
        `description` varchar(255) not null,
        `rescue_date` date not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `appointment_state` varchar(255),
        `date_time` datetime(6) not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` integer not null,
        `price` double precision not null,
        `score` double precision not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility_appointment` (
       `facility_id` varchar(255) not null,
        `appointment_id` varchar(255) not null
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        `health_reference` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        `pet_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` varchar(255) not null,
        `observation` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` integer not null,
        `text` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `adoption` 
       add constraint `FKnj4oxvdqwi67lwnix8jf4210b` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `appointment` 
       add constraint `FKe5m4nyc25ulwyfjh5jvb7yug5` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `facility_appointment` 
       add constraint `FK952ou25fcfuhp2p0529ti7k0a` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `facility_appointment` 
       add constraint `FK6l3awywis2pl5o1rtnwfu2141` 
       foreign key (`facility_id`) 
       references `facility` (`id`);

    alter table `health_reference` 
       add constraint `FK9d6adh2yrel96vhdps7h9d8rd` 
       foreign key (`health_reference`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlbelb744wokt374tjqo39c9oa` 
       foreign key (`pet_id`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlwg96qwwl94pl1433godpm9vm` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `result` 
       add constraint `FKfeebv8qqww3qv4vpn61gc07yo` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `review` 
       add constraint `FK4os5q7otpuj8p5ik0muqktr5i` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` bit not null,
        `adoption_date` date not null,
        `description` varchar(255) not null,
        `rescue_date` date not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `appointment_state` varchar(255),
        `date_time` datetime(6) not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` integer not null,
        `price` double precision not null,
        `score` double precision not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility_appointment` (
       `facility_id` varchar(255) not null,
        `appointment_id` varchar(255) not null
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        `health_reference` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        `pet_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` varchar(255) not null,
        `observation` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` integer not null,
        `text` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `adoption` 
       add constraint `FKnj4oxvdqwi67lwnix8jf4210b` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `appointment` 
       add constraint `FKe5m4nyc25ulwyfjh5jvb7yug5` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `facility_appointment` 
       add constraint `FK952ou25fcfuhp2p0529ti7k0a` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `facility_appointment` 
       add constraint `FK6l3awywis2pl5o1rtnwfu2141` 
       foreign key (`facility_id`) 
       references `facility` (`id`);

    alter table `health_reference` 
       add constraint `FK9d6adh2yrel96vhdps7h9d8rd` 
       foreign key (`health_reference`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlbelb744wokt374tjqo39c9oa` 
       foreign key (`pet_id`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlwg96qwwl94pl1433godpm9vm` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `result` 
       add constraint `FKfeebv8qqww3qv4vpn61gc07yo` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `review` 
       add constraint `FK4os5q7otpuj8p5ik0muqktr5i` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` bit not null,
        `adoption_date` date not null,
        `description` varchar(255) not null,
        `rescue_date` date not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `appointment_state` varchar(255),
        `date_time` datetime(6) not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` integer not null,
        `price` double precision not null,
        `score` double precision not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility_appointment` (
       `facility_id` varchar(255) not null,
        `appointment_id` varchar(255) not null
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        `health_reference` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        `pet_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` varchar(255) not null,
        `observation` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` integer not null,
        `text` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `adoption` 
       add constraint `FKnj4oxvdqwi67lwnix8jf4210b` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `appointment` 
       add constraint `FKe5m4nyc25ulwyfjh5jvb7yug5` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `facility_appointment` 
       add constraint `FK952ou25fcfuhp2p0529ti7k0a` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `facility_appointment` 
       add constraint `FK6l3awywis2pl5o1rtnwfu2141` 
       foreign key (`facility_id`) 
       references `facility` (`id`);

    alter table `health_reference` 
       add constraint `FK9d6adh2yrel96vhdps7h9d8rd` 
       foreign key (`health_reference`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlbelb744wokt374tjqo39c9oa` 
       foreign key (`pet_id`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlwg96qwwl94pl1433godpm9vm` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `result` 
       add constraint `FKfeebv8qqww3qv4vpn61gc07yo` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `review` 
       add constraint `FK4os5q7otpuj8p5ik0muqktr5i` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` bit not null,
        `adoption_date` date not null,
        `description` varchar(255) not null,
        `rescue_date` date not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `appointment_state` varchar(255),
        `date_time` datetime(6) not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` integer not null,
        `price` double precision not null,
        `score` double precision not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility_appointment` (
       `facility_id` varchar(255) not null,
        `appointment_id` varchar(255) not null
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        `health_reference` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        `pet_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` varchar(255) not null,
        `observation` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` integer not null,
        `text` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `adoption` 
       add constraint `FKnj4oxvdqwi67lwnix8jf4210b` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `appointment` 
       add constraint `FKe5m4nyc25ulwyfjh5jvb7yug5` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `facility_appointment` 
       add constraint `FK952ou25fcfuhp2p0529ti7k0a` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `facility_appointment` 
       add constraint `FK6l3awywis2pl5o1rtnwfu2141` 
       foreign key (`facility_id`) 
       references `facility` (`id`);

    alter table `health_reference` 
       add constraint `FK9d6adh2yrel96vhdps7h9d8rd` 
       foreign key (`health_reference`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlbelb744wokt374tjqo39c9oa` 
       foreign key (`pet_id`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlwg96qwwl94pl1433godpm9vm` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `result` 
       add constraint `FKfeebv8qqww3qv4vpn61gc07yo` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `review` 
       add constraint `FK4os5q7otpuj8p5ik0muqktr5i` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` bit not null,
        `adoption_date` date not null,
        `description` varchar(255) not null,
        `rescue_date` date not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `appointment_state` varchar(255),
        `date_time` datetime(6) not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` integer not null,
        `price` double precision not null,
        `score` double precision not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility_appointment` (
       `facility_id` varchar(255) not null,
        `appointment_id` varchar(255) not null
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        `health_reference` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        `pet_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` varchar(255) not null,
        `observation` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` integer not null,
        `text` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `adoption` 
       add constraint `FKnj4oxvdqwi67lwnix8jf4210b` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `appointment` 
       add constraint `FKe5m4nyc25ulwyfjh5jvb7yug5` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `facility_appointment` 
       add constraint `FK952ou25fcfuhp2p0529ti7k0a` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `facility_appointment` 
       add constraint `FK6l3awywis2pl5o1rtnwfu2141` 
       foreign key (`facility_id`) 
       references `facility` (`id`);

    alter table `health_reference` 
       add constraint `FK9d6adh2yrel96vhdps7h9d8rd` 
       foreign key (`health_reference`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlbelb744wokt374tjqo39c9oa` 
       foreign key (`pet_id`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlwg96qwwl94pl1433godpm9vm` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `result` 
       add constraint `FKfeebv8qqww3qv4vpn61gc07yo` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `review` 
       add constraint `FK4os5q7otpuj8p5ik0muqktr5i` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` bit not null,
        `adoption_date` date not null,
        `description` varchar(255) not null,
        `rescue_date` date not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `appointment_state` varchar(255),
        `date_time` datetime(6) not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` integer not null,
        `price` double precision not null,
        `score` double precision not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility_appointment` (
       `facility_id` varchar(255) not null,
        `appointment_id` varchar(255) not null
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        `health_reference` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        `pet_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` varchar(255) not null,
        `observation` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` integer not null,
        `text` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `adoption` 
       add constraint `FKnj4oxvdqwi67lwnix8jf4210b` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `appointment` 
       add constraint `FKe5m4nyc25ulwyfjh5jvb7yug5` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `facility_appointment` 
       add constraint `FK952ou25fcfuhp2p0529ti7k0a` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `facility_appointment` 
       add constraint `FK6l3awywis2pl5o1rtnwfu2141` 
       foreign key (`facility_id`) 
       references `facility` (`id`);

    alter table `health_reference` 
       add constraint `FK9d6adh2yrel96vhdps7h9d8rd` 
       foreign key (`health_reference`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlbelb744wokt374tjqo39c9oa` 
       foreign key (`pet_id`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlwg96qwwl94pl1433godpm9vm` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `result` 
       add constraint `FKfeebv8qqww3qv4vpn61gc07yo` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `review` 
       add constraint `FK4os5q7otpuj8p5ik0muqktr5i` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` bit not null,
        `adoption_date` date not null,
        `description` varchar(255) not null,
        `rescue_date` date not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `appointment_state` varchar(255),
        `date_time` datetime(6) not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` integer not null,
        `price` double precision not null,
        `score` double precision not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility_appointment` (
       `facility_id` varchar(255) not null,
        `appointment_id` varchar(255) not null
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        `health_reference` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        `pet_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` varchar(255) not null,
        `observation` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` integer not null,
        `text` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `adoption` 
       add constraint `FKnj4oxvdqwi67lwnix8jf4210b` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `appointment` 
       add constraint `FKe5m4nyc25ulwyfjh5jvb7yug5` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `facility_appointment` 
       add constraint `FK952ou25fcfuhp2p0529ti7k0a` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `facility_appointment` 
       add constraint `FK6l3awywis2pl5o1rtnwfu2141` 
       foreign key (`facility_id`) 
       references `facility` (`id`);

    alter table `health_reference` 
       add constraint `FK9d6adh2yrel96vhdps7h9d8rd` 
       foreign key (`health_reference`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlbelb744wokt374tjqo39c9oa` 
       foreign key (`pet_id`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlwg96qwwl94pl1433godpm9vm` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `result` 
       add constraint `FKfeebv8qqww3qv4vpn61gc07yo` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `review` 
       add constraint `FK4os5q7otpuj8p5ik0muqktr5i` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` bit not null,
        `adoption_date` date not null,
        `description` varchar(255) not null,
        `rescue_date` date not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `appointment_state` varchar(255),
        `date_time` datetime(6) not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` integer not null,
        `price` double precision not null,
        `score` double precision not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility_appointment` (
       `facility_id` varchar(255) not null,
        `appointment_id` varchar(255) not null
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        `health_reference` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        `pet_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` varchar(255) not null,
        `observation` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` integer not null,
        `text` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `adoption` 
       add constraint `FKnj4oxvdqwi67lwnix8jf4210b` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `appointment` 
       add constraint `FKe5m4nyc25ulwyfjh5jvb7yug5` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `facility_appointment` 
       add constraint `FK952ou25fcfuhp2p0529ti7k0a` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `facility_appointment` 
       add constraint `FK6l3awywis2pl5o1rtnwfu2141` 
       foreign key (`facility_id`) 
       references `facility` (`id`);

    alter table `health_reference` 
       add constraint `FK9d6adh2yrel96vhdps7h9d8rd` 
       foreign key (`health_reference`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlbelb744wokt374tjqo39c9oa` 
       foreign key (`pet_id`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlwg96qwwl94pl1433godpm9vm` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `result` 
       add constraint `FKfeebv8qqww3qv4vpn61gc07yo` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `review` 
       add constraint `FK4os5q7otpuj8p5ik0muqktr5i` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` bit not null,
        `adoption_date` date not null,
        `description` varchar(255) not null,
        `rescue_date` date not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `appointment_state` varchar(255),
        `date_time` datetime(6) not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` integer not null,
        `price` double precision not null,
        `score` double precision not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility_appointment` (
       `facility_id` varchar(255) not null,
        `appointment_id` varchar(255) not null
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        `health_reference` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        `pet_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` varchar(255) not null,
        `observation` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` integer not null,
        `text` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `adoption` 
       add constraint `FKnj4oxvdqwi67lwnix8jf4210b` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `appointment` 
       add constraint `FKe5m4nyc25ulwyfjh5jvb7yug5` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `facility_appointment` 
       add constraint `FK952ou25fcfuhp2p0529ti7k0a` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `facility_appointment` 
       add constraint `FK6l3awywis2pl5o1rtnwfu2141` 
       foreign key (`facility_id`) 
       references `facility` (`id`);

    alter table `health_reference` 
       add constraint `FK9d6adh2yrel96vhdps7h9d8rd` 
       foreign key (`health_reference`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlbelb744wokt374tjqo39c9oa` 
       foreign key (`pet_id`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlwg96qwwl94pl1433godpm9vm` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `result` 
       add constraint `FKfeebv8qqww3qv4vpn61gc07yo` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `review` 
       add constraint `FK4os5q7otpuj8p5ik0muqktr5i` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` bit not null,
        `adoption_date` date not null,
        `description` varchar(255) not null,
        `rescue_date` date not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `appointment_state` varchar(255),
        `date_time` datetime(6) not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` integer not null,
        `price` double precision not null,
        `score` double precision not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility_appointment` (
       `facility_id` varchar(255) not null,
        `appointment_id` varchar(255) not null
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        `health_reference` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        `pet_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` varchar(255) not null,
        `observation` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` integer not null,
        `text` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `adoption` 
       add constraint `FKnj4oxvdqwi67lwnix8jf4210b` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `appointment` 
       add constraint `FKe5m4nyc25ulwyfjh5jvb7yug5` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `facility_appointment` 
       add constraint `FK952ou25fcfuhp2p0529ti7k0a` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `facility_appointment` 
       add constraint `FK6l3awywis2pl5o1rtnwfu2141` 
       foreign key (`facility_id`) 
       references `facility` (`id`);

    alter table `health_reference` 
       add constraint `FK9d6adh2yrel96vhdps7h9d8rd` 
       foreign key (`health_reference`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlbelb744wokt374tjqo39c9oa` 
       foreign key (`pet_id`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlwg96qwwl94pl1433godpm9vm` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `result` 
       add constraint `FKfeebv8qqww3qv4vpn61gc07yo` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `review` 
       add constraint `FK4os5q7otpuj8p5ik0muqktr5i` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    create table `adoption` (
       `id` varchar(255) not null,
        `adopted` bit not null,
        `adoption_date` date not null,
        `description` varchar(255) not null,
        `rescue_date` date not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `appointment` (
       `id` varchar(255) not null,
        `appointment_state` varchar(255),
        `date_time` datetime(6) not null,
        `pet_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility` (
       `id` varchar(255) not null,
        `description` varchar(255) not null,
        `name` varchar(255) not null,
        `no_appointments` integer not null,
        `price` double precision not null,
        `score` double precision not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `facility_appointment` (
       `facility_id` varchar(255) not null,
        `appointment_id` varchar(255) not null
    ) engine=InnoDB;

    create table `health_reference` (
       `id` varchar(255) not null,
        `text` varchar(255) not null,
        `title` varchar(255) not null,
        `health_reference` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet` (
       `id` varchar(255) not null,
        `age` integer,
        `name` varchar(255),
        `pet_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `pet_type` (
       `id` varchar(255) not null,
        `type` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `result` (
       `id` varchar(255) not null,
        `details` varchar(255) not null,
        `observation` varchar(255) not null,
        `appointment_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `review` (
       `id` varchar(255) not null,
        `score` integer not null,
        `text` varchar(255) not null,
        `facility_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `adoption` 
       add constraint `FKnj4oxvdqwi67lwnix8jf4210b` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `appointment` 
       add constraint `FKe5m4nyc25ulwyfjh5jvb7yug5` 
       foreign key (`pet_id`) 
       references `pet` (`id`);

    alter table `facility_appointment` 
       add constraint `FK952ou25fcfuhp2p0529ti7k0a` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `facility_appointment` 
       add constraint `FK6l3awywis2pl5o1rtnwfu2141` 
       foreign key (`facility_id`) 
       references `facility` (`id`);

    alter table `health_reference` 
       add constraint `FK9d6adh2yrel96vhdps7h9d8rd` 
       foreign key (`health_reference`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlbelb744wokt374tjqo39c9oa` 
       foreign key (`pet_id`) 
       references `pet_type` (`id`);

    alter table `pet` 
       add constraint `FKlwg96qwwl94pl1433godpm9vm` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `result` 
       add constraint `FKfeebv8qqww3qv4vpn61gc07yo` 
       foreign key (`appointment_id`) 
       references `appointment` (`id`);

    alter table `review` 
       add constraint `FK1fvpodkxrvv1vw81wo5fapney` 
       foreign key (`facility_id`) 
       references `facility` (`id`);
