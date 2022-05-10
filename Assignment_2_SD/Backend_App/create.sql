
    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    create table `admin` (
       `id` varchar(255) not null,
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `cart` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `food` (
       `id` varchar(255) not null,
        `category` varchar(255),
        `description` varchar(255),
        `name` varchar(255),
        `price` double precision,
        `restaurant_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `order_state` varchar(255),
        `total_amount` double precision,
        `user_id` varchar(255),
        `zone_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_details` (
       `id` varchar(255) not null,
        `quantity` integer,
        `food_id` varchar(255),
        `order_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant` (
       `id` varchar(255) not null,
        `location` varchar(255),
        `name` varchar(255),
        `admin_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurant_zone` (
       `restaurant_id` varchar(255) not null,
        `zone_id` varchar(255) not null
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

    create table `zone` (
       `id` varchar(255) not null,
        `city` varchar(255),
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `admin` 
       add constraint `FKtbd7s4qjdoai29j91uim1ks4r` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `cart` 
       add constraint `FKr03q13oupg5rbxnxkril5sf68` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `cart` 
       add constraint `FKbmo4tkl6m9od5wdc8gdd65vrb` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `food` 
       add constraint `FKjdi3g86encj7223cxpc6e0lls` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);

    alter table `order` 
       add constraint `FK5ds52cnxjw9c99ovccne0axk0` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `order` 
       add constraint `FKsavabc6jv3k3spd1t7etujce5` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `order_details` 
       add constraint `FK29h5obklaiddg322n619tldll` 
       foreign key (`food_id`) 
       references `food` (`id`);

    alter table `order_details` 
       add constraint `FKc5a0u9dt7xcf06m3yy4ren60c` 
       foreign key (`order_id`) 
       references `order` (`id`);

    alter table `restaurant` 
       add constraint `FK9my1m3g84j8arg6f1u8dfq79w` 
       foreign key (`admin_id`) 
       references `admin` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKlnsmwsgxskeq76kkgoj4qs031` 
       foreign key (`zone_id`) 
       references `zone` (`id`);

    alter table `restaurant_zone` 
       add constraint `FKorxteqxhgqv1a460kjt0v29ek` 
       foreign key (`restaurant_id`) 
       references `restaurant` (`id`);
