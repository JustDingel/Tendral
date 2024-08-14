CREATE TABLE players (
    uuid VARCHAR(36) PRIMARY KEY,
    last_login date DEFAULT NULL,
    profiles_created INT DEFAULT 0,
    selected_profile_id INT DEFAULT 0
    );
