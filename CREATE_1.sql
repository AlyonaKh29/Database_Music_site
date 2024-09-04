create table if not exists genre (
    Genre_id SERIAL primary key,
    Genre_name VARCHAR(30) not null
);

create table if not exists person (
    Artist_id SERIAL primary key,
    Nickname VARCHAR(30) not null
);

create table if not exists musician (
    id SERIAL primary key,
    Genre_id INTEGER not null references Genre(Genre_id),
    Artist_id INTEGER not null references Person(Artist_id)
);

create table if not exists album (
    Album_id SERIAL primary key,
    Album_name VARCHAR(60) not NULL,
    Creation_date DATE
);

create table if not exists repertoire (
    id SERIAL primary key,
    Artist_id INTEGER not null references Person(Artist_id),
    Album_id INTEGER not null references Album(Album_id)
);

create table if not exists track (
    Track_id SERIAL primary key,
    Album_id INTEGER not null references Album(Album_id),
    Track_name VARCHAR(60) not null,
    Duration INTEGER not null
);

create table if not exists collection (
    Collection_id SERIAL primary key,
    Title VARCHAR(80) not null,
    Creation_date DATE
);

create table if not exists track_collection (
    id SERIAL primary key,
    Track_id INTEGER not null references track(Track_id),
    Collection_id INTEGER not null references collection(Collection_id)
);


    
