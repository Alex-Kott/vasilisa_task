CREATE TABLE User (
    id int NOT NULL,
    City VARCHAR NOT NULL,
    Country VARCHAR NOT NULL,
    StateRegion VARCHAR,
    ZIPPostalCode int,
    AreaCode VARCHAR,
    UnitSize VARCHAR,
    DeviceType VARCHAR,
    OperationSystemType VARCHAR,
    BrowserType VARCHAR,
    PRIMARY KEY (id)
);

CREATE TABLE Search (
    id int NOT NULL,
    QueryString VARCHAR,
    ConvertionId int NOT NULL,
    ConvertionDate DATE,
    SiteVisitReferralDomain VARCHAR ,
    UserId int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (UserId) REFERENCES User(id)
)

CREATE TABLE Product(
    id int NOT NULL,
    ProductInfo VARCHAR,
    PRIMARY KEY (id)
)

CREATE TABLE Order (
    id int NOT NULL,
    date DATE,
    ProductId int NOT NULL,
    Quantity int,
    Currency CHAR(3),
    SearchId int,
    PRIMARY KEY (id),
    FOREIGN KEY (ProductId) REFERENCES Product(id),
    FOREIGN KEY (SearchId) REFERENCES Search(id)
)


SELECT * FROM Order O JOIN Product P on O.ProductId = P.id
JOIN Search S on O.SearchId = S.id
JOIN User U on S.UserId = U.id
WHERE O.date = '01.01.2019'; -- выберет все заказы, сделанные 1 января 2019


SELECT * FROM Order O JOIN Product P on O.ProductId = P.id
JOIN Search S on O.SearchId = S.id
JOIN User U on S.UserId = U.id
WHERE U.City = 'Moscow'; -- выберет все заказы пользователей из Москвы