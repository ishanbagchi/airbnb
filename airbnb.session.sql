-- @BLOCK
CREATE TABLE Users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    bio TEXT,
    country VARCHAR(2)
);
-- @BLOCK
INSERT INTO Users (email, bio, country)
VALUES (
        "hello@world.com",
        "i love dogs!",
        "IN"
    );
-- @BLOCK
INSERT INTO Users (email, bio, country)
VALUES ("hola@munda.com", "bar", "MX"),
    ("bonjour@monde.com", "baz", "FR");
-- @BLOCK
SELECT *
FROM Users;
-- @BLOCK
SELECT id,
    email
FROM Users;
-- @BLOCK
SELECT *
FROM Users
WHERE country = "IN"
    AND id <= 1
ORDER BY id DESC
LIMIT 2;
-- @BLOCK
SELECT *
FROM Users
WHERE country = "IN"
    AND email LIKE "h%"
ORDER BY id DESC
LIMIT 2;
-- @BLOCK
CREATE INDEX email_index ON Users(email);
-- @BLOCK
CREATE TABLE Rooms (
    id INT AUTO_INCREMENT,
    street VARCHAR(255),
    owner_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES Users(id)
);
-- @BLOCK
INSERT into Rooms(owner_id, street)
values (1, "san diego sailboat"),
    (1, "nantaket cottage"),
    (1, "vail cabin"),
    (1, "sf cardboard box");
-- @BLOCK
select *
from Users
    inner join Rooms on Rooms.owner_id = Users.id;
-- @BLOCK
select *
from Users
    left join Rooms on Rooms.owner_id = Users.id;
-- @BLOCK
select Users.id as user_id,
    Rooms.id as room_id,
    email,
    street
from Users
    inner join Rooms on Rooms.owner_id = Users.id;
-- @BLOCK
CREATE TABLE Bookings(
    id INT AUTO_INCREMENT,
    guest_id INT NOT NULL,
    room_id INT NOT NULL,
    check_in DATETIME,
    PRIMARY KEY (id),
    FOREIGN KEY (guest_id) REFERENCES Users(id),
    FOREIGN KEY (room_id) REFERENCES Rooms(id)
);
-- @BLOCK
SELECT guest_id,
    street,
    check_in
FROM Bookings
    INNER JOIN Rooms ON Rooms.owner_id = guest_id
WHERE guest_id = 1;
-- @BLOCK
SELECT guest_id,
    street,
    check_in
FROM Bookings
    INNER JOIN Rooms ON Rooms.owner_id = guest_id
WHERE room_id = 2;