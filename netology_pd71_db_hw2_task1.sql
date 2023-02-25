CREATE TABLE IF NOT EXISTS musical_artist (
    PRIMARY KEY (id),
    id   SERIAL,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS musical_album (
    PRIMARY KEY (id),
    id              SERIAL,
    name            VARCHAR(50) NOT NULL,
    year_of_release INTEGER     NOT NULL
);

CREATE TABLE IF NOT EXISTS musical_album_artist (
    musical_album_id  INTEGER REFERENCES musical_album(id),
    musical_artist_id INTEGER REFERENCES musical_artist(id),
                      CONSTRAINT pk_musical_album_artist
                      PRIMARY KEY (musical_album_id, musical_artist_id)
);

CREATE TABLE IF NOT EXISTS musical_genre (
    PRIMARY KEY (id),
    id   SERIAL ,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS musical_artist_genre (
    musical_artist_id INTEGER REFERENCES musical_artist(id),
    musical_genre_id  INTEGER REFERENCES musical_genre(id),
                      CONSTRAINT pk_musical_artist_genre
                      PRIMARY KEY (musical_artist_id, musical_genre_id)
);

CREATE TABLE IF NOT EXISTS musical_track (
    PRIMARY KEY (id),
    id               SERIAL,
    name             VARCHAR(50) NOT NULL,
    duration         INTEGER     NOT NULL,
    musical_album_id INTEGER     NOT NULL REFERENCES musical_album(id)
);

CREATE TABLE IF NOT EXISTS music_collection (
    PRIMARY KEY (id),
    id              SERIAL,
    name            VARCHAR(50) NOT NULL,
    year_of_release INTEGER     NOT NULL
);

CREATE TABLE IF NOT EXISTS musical_track_collection (
    musical_track_id    INTEGER REFERENCES musical_track(id),
    music_collection_id INTEGER REFERENCES music_collection(id),
                        CONSTRAINT pk_musical_track_collection
                        PRIMARY KEY (musical_track_id, music_collection_id)
);