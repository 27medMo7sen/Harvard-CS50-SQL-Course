CREATE TABLE "ingredients" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "price_per_unit" TEXT NOT NULL,
    PRIMARY KEY ("id")
);
CREATE TABLE "donuts"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "price" INTEGER,
    PRIMARY KEY ("id")
);
CREATE TABLE "ingredients_for_donut"(
    "id" INTEGER,
    "donut_id" INTEGER,
    "ingredient_id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("donut_id") REFERENCES "donut"("id"),
    FOREIGN KEY ("ingredient_id") REFERENCES "ingredients"("id")
);
CREATE TABLE "donuts_in_order"(
    "id" INTEGER,
    "order_id" INTEGER,
    "donut_id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("donut_id") REFERENCES "donut"("id"),
    FOREIGN KEY ("order_id") REFERENCES "order"("id")
);
CREATE TABLE "orders"(
    "id" INTEGER,
    "costumer_id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("costumer_id") REFERENCES "costumers"("id")
);
CREATE TABLE "costumers"(
    "id" INTEGER,
    "name" TEXT,
    PRIMARY KEY ("id")
);
