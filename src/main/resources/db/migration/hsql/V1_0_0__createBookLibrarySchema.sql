CREATE TABLE AUTHOR (
                        AUTHOR_ID INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
                        NAME VARCHAR(255) NOT NULL,
                        EMAIL VARCHAR(255) NOT NULL
);

CREATE TABLE BOOK (
                      BOOK_ID INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
                      TITLE VARCHAR(255) NOT NULL,
                      CATEGORY_TYPE INTEGER NOT NULL,
                      AUTHOR_ID INTEGER NOT NULL,
                      ISBN VARCHAR(255) NOT NULL,
                      PUBLISH_DATE DATE NOT NULL,
                      AVAILABLE_FROM TIMESTAMP NOT NULL,

                      CONSTRAINT FK_AUTHOR_BOOK FOREIGN KEY (AUTHOR_ID) REFERENCES AUTHOR(AUTHOR_ID)
);

CREATE TABLE MEMBER (
                        MEMBER_ID INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
                        NAME VARCHAR(255) NOT NULL,
                        EMAIL VARCHAR(255) NOT NULL,
                        PASSWORD VARCHAR(255) NOT NULL,
                        PHONE_NUMBER VARCHAR(255) NOT NULL,
                        START_DATE DATE NOT NULL,
                        END_DATE DATE NOT NULL,
                        CURRENT_ADDRESS VARCHAR(255) NOT NULL,
                        PERMANENT_ADDRESS VARCHAR(255) NOT NULL,
                        DATE_OF_BIRTH DATE NOT NULL,
                        ROLE INTEGER NOT NULL,
                        STATUS INTEGER NOT NULL
);

CREATE TABLE BOOK_ISSUED (
                             BOOK_ISSUED_ID INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
                             BOOK_ID INTEGER NOT NULL,
                             MEMBER_ID INTEGER NOT NULL,
                             ISSUE_DATE TIMESTAMP NOT NULL,
                             RETURN_DATE TIMESTAMP NOT NULL,
                             ISSUED_BY INTEGER NOT NULL,
                             STATUS INTEGER NOT NULL,
                             FINE DECIMAL(10, 2) NOT NULL,
                             REMARKS VARCHAR(255) NOT NULL,

                             CONSTRAINT FK_BOOK_ISSUED_MEMBER_ID FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER(MEMBER_ID),
                             CONSTRAINT FK_BOOK_ISSUED_BOOK_ID FOREIGN KEY (BOOK_ID) REFERENCES BOOK(BOOK_ID)
);