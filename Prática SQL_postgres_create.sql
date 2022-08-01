CREATE TABLE "public.client" (
	"id" serial NOT NULL,
	"name" serial NOT NULL,
	"email" serial NOT NULL UNIQUE,
	"password" serial(8) NOT NULL,
	CONSTRAINT "client_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"price" double NOT NULL,
	"photoId" integer NOT NULL,
	"categoryId" integer NOT NULL,
	"sizeId" integer NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.productImages" (
	"id" serial NOT NULL,
	"productId" integer NOT NULL,
	"mainPhoto" BOOLEAN NOT NULL,
	"uri" varchar(2000) NOT NULL UNIQUE,
	CONSTRAINT "productImages_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.city" (
	"id" serial NOT NULL,
	"name" TEXT(50) NOT NULL UNIQUE,
	CONSTRAINT "city_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.productCategory" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "productCategory_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.productSize" (
	"id" serial NOT NULL,
	"size" TEXT(1-2) NOT NULL UNIQUE,
	CONSTRAINT "productSize_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.order" (
	"id" serial NOT NULL,
	"clientId" integer NOT NULL,
	"productId" integer NOT NULL,
	"amount" integer NOT NULL,
	"statusId" integer NOT NULL,
	"date" DATE NOT NULL DEFAULT 'now ()',
	"adressId" integer NOT NULL,
	CONSTRAINT "order_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.orderStatus" (
	"id" serial NOT NULL,
	"status" serial NOT NULL,
	CONSTRAINT "orderStatus_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.clientAdress" (
	"clientId" serial NOT NULL UNIQUE,
	"street" TEXT(100) NOT NULL,
	"number" integer NOT NULL,
	"postCode" TEXT NOT NULL,
	"cityId" integer NOT NULL,
	CONSTRAINT "clientAdress_pk" PRIMARY KEY ("clientId")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("photoId") REFERENCES "productImages"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk1" FOREIGN KEY ("categoryId") REFERENCES "productCategory"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk2" FOREIGN KEY ("sizeId") REFERENCES "productSize"("id");





ALTER TABLE "order" ADD CONSTRAINT "order_fk0" FOREIGN KEY ("clientId") REFERENCES "client"("id");
ALTER TABLE "order" ADD CONSTRAINT "order_fk1" FOREIGN KEY ("productId") REFERENCES "products"("id");
ALTER TABLE "order" ADD CONSTRAINT "order_fk2" FOREIGN KEY ("statusId") REFERENCES "orderStatus"("id");
ALTER TABLE "order" ADD CONSTRAINT "order_fk3" FOREIGN KEY ("adressId") REFERENCES "clientAdress"("clientId");


ALTER TABLE "clientAdress" ADD CONSTRAINT "clientAdress_fk0" FOREIGN KEY ("clientId") REFERENCES "client"("id");
ALTER TABLE "clientAdress" ADD CONSTRAINT "clientAdress_fk1" FOREIGN KEY ("cityId") REFERENCES "city"("id");










