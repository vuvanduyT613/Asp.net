CREATE TABLE Nember (
	NemberId INT NOT NULL IDENTITY (1,1),
	FullName NVARCHAR(50),
	UserName NVARCHAR(50),
	Email NVARCHAR(50),
	PhoneNumber VARCHAR(14),
	PassWords VARCHAR(50),
	CONSTRAINT pk_NemberId PRIMARY KEY (NemberId)
)

CREATE TABLE Product (
	ProductId INT NOT NULL IDENTITY (1,1),
	ProductName NVARCHAR(50),
	ProductType NVARCHAR(10),
	Descriptions NVARCHAR(50),
	Price FLOAT,
	ImageSource VARCHAR(50),
	CONSTRAINT pk_ProductId PRIMARY KEY (ProductId)
)

CREATE TABLE Cart (
	CartId INT NOT NULL IDENTITY (1,1),
	NemberId INT NOT NULL,
	ProductId INT NOT NULL,
	CONSTRAINT pk_CartId PRIMARY KEY (CartId),
	CONSTRAINT fk_NemberId FOREIGN KEY (NemberId) REFERENCES Nember(NemberId),
	CONSTRAINT fk_ProductId FOREIGN KEY (ProductId) REFERENCES Product(ProductId)
)

CREATE TABLE Transactions (
	TransactionId INT NOT NULL IDENTITY (1,1),
	NemberId INT NOT NULL,
	ProductId INT NOT NULL,
	Quality NVARCHAR(30),
	StatusT VARCHAR(30),
	CONSTRAINT pk_TransactionId PRIMARY KEY (TransactionId),
	CONSTRAINT fk_Nember_Id FOREIGN KEY (NemberId) REFERENCES Nember(NemberId),
	CONSTRAINT fk_Product_Id FOREIGN KEY (ProductId) REFERENCES Product(ProductId)
) 

CREATE TABLE Bill (
	BillId INT NOT NULL IDENTITY (1,1),
	NemberId INT NOT NULL,
	TotalProduct NVARCHAR(100),
	TotalPrice FLOAT ,
	FeedBack VARCHAR(50),
	CONSTRAINT pk_BillId PRIMARY KEY (BillId),
	CONSTRAINT fk_Nember_Id1 FOREIGN KEY (NemberId) REFERENCES Nember(NemberId)
)

