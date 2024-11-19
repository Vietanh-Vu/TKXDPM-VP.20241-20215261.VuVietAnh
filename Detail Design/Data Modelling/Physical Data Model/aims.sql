-- Create Media table
CREATE TABLE Media (
                       id INTEGER PRIMARY KEY,
                       category VARCHAR(45) NOT NULL,
                       price INTEGER NOT NULL,
                       quantity INTEGER NOT NULL,
                       title VARCHAR(45) NOT NULL,
                       value INTEGER NOT NULL,
                       imageURL VARCHAR(45) NOT NULL,
                       supportRushOrder BIT NOT NULL,
                       weight FLOAT
);

-- Create CD table
CREATE TABLE CD (
                    id INTEGER PRIMARY KEY,
                    artist VARCHAR(45) NOT NULL,
                    recordLabel VARCHAR(45) NOT NULL,
                    musicType VARCHAR(45) NOT NULL,
                    releaseDate DATE,
                    FOREIGN KEY (id) REFERENCES Media(id)
);

-- Create Book table
CREATE TABLE Book (
                      id INTEGER PRIMARY KEY,
                      author VARCHAR(45) NOT NULL,
                      coverType VARCHAR(45) NOT NULL,
                      publisher VARCHAR(45) NOT NULL,
                      publishDate DATE NOT NULL,
                      numberOfPage INTEGER NOT NULL,
                      language VARCHAR(45) NOT NULL,
                      bookCategory VARCHAR(45) NOT NULL,
                      FOREIGN KEY (id) REFERENCES Media(id)
);

-- Create DVD table
CREATE TABLE DVD (
                     id INTEGER PRIMARY KEY,
                     discType VARCHAR(45) NOT NULL,
                     director VARCHAR(45) NOT NULL,
                     runtime INTEGER NOT NULL,
                     studio VARCHAR(45) NOT NULL,
                     subtitle VARCHAR(45) NOT NULL,
                     releaseDate DATE NOT NULL,
                     FilmType VARCHAR(45) NOT NULL,
                     FOREIGN KEY (id) REFERENCES Media(id)
);

-- Create DeliveryInfo table
CREATE TABLE DeliveryInfo (
                              id INTEGER PRIMARY KEY AUTO_INCREMENT,
                              name VARCHAR(45) NOT NULL,
                              province VARCHAR(45) NOT NULL,
                              instructions VARCHAR(200),
                              address VARCHAR(100) NOT NULL
);

-- Create Order table
CREATE TABLE `Order` (
                         id INTEGER PRIMARY KEY,
                         shippingFees VARCHAR(45) NOT NULL,
                         deliveryInfoId INTEGER NOT NULL,
                         FOREIGN KEY (deliveryInfoId) REFERENCES DeliveryInfo(id)
);

-- Create OrderMedia table
CREATE TABLE OrderMedia (
                            mediaID INTEGER,
                            orderID INTEGER,
                            price INTEGER NOT NULL,
                            quantity INTEGER NOT NULL,
                            isRushOrder BIT NOT NULL,
                            PRIMARY KEY (mediaID, orderID),
                            FOREIGN KEY (mediaID) REFERENCES Media(id),
                            FOREIGN KEY (orderID) REFERENCES `Order`(id)
);

-- Create Invoice table
CREATE TABLE Invoice (
                         id INTEGER PRIMARY KEY,
                         totalAmount INTEGER NOT NULL,
                         orderId INTEGER NOT NULL,
                         FOREIGN KEY (orderId) REFERENCES `Order`(id)
);

-- Create PaymentTransaction table
CREATE TABLE PaymentTransaction (
                                    id INTEGER PRIMARY KEY,
                                    createAt DATETIME NOT NULL,
                                    content VARCHAR(45) NOT NULL,
                                    method VARCHAR(45) NOT NULL,
                                    cardNumber INTEGER NOT NULL,
                                    invoiceId INTEGER NOT NULL,
                                    FOREIGN KEY (invoiceId) REFERENCES Invoice(id)
);