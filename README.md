# E-Commerce Database (UI Project)

A PostgreSQL relational database for an e-commerce platform, covering orders, products, pricing, delivery, warehouses, discounts, and reviews. Includes SQL queries, views, stored procedures, functions, transactions, and index optimization.

---

## Tech Stack

- **PostgreSQL** — database
- **SQL** — DDL, DML, views, stored procedures, functions, transactions, indexes

---

## Schema (20 tables)

| Domain | Tables |
|--------|--------|
| Users and Location | korisnik, lokacija, lokacije_korisnika, grad, drzava |
| Products | proizvod, kategorija, potkategorija, cena, cenovnik, popust |
| Orders | porudzbina, proizvodi_u_porudzbini, recenzija |
| Delivery | isporuka_porudzbine, slanje_porudzbine, kurirska_sluzba, distributivni_centar |
| Warehouse | skladiste, proizvodi_u_skladistu |

---

## Files

| File | Description |
|------|-------------|
| skripta1.sql | DDL - creates all tables and constraints |
| insert_into.sql | Sample data inserts |
| sql_upiti.sql | 10 analytical queries (revenue, top products, reviews, deliveries...) |
| view, procedure, funkcije.sql | 3 views, 2 stored procedures, 2 functions |
| transakcije.sql | Transactions wrapped in procedures |
| indeksi.sql | Index creation with EXPLAIN analysis |
| model_baze.pdf | Database model diagram |
| Izvestaj.docx | Project report |

---

## Analytical Queries

1. Total revenue from orders
2. Product reviews overview
3. Products sold per warehouse
4. Top 5 products by price
5. Users with the most reviews
6. Deliveries per distribution center
7. Revenue by country
8. Average product rating per category
9. Products per order
10. Users per location

---

## Views and Routines

**Views:** pregled_porudzbine, view_proizvodi_sa_cenama, view_korisnici_porudzbine

**Stored Procedures:** add_order, update_order_shipping

**Functions:** avg_product_rating(product_id), count_user_orders(user_id)

---

## Setup

```bash
psql -U postgres -f skripta1.sql
psql -U postgres -d domaci1 -f insert_into.sql
```
