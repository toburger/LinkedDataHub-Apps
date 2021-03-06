#!/bin/bash

[ -z "$SCRIPT_ROOT" ] && echo "Need to set SCRIPT_ROOT" && exit 1;

if [ "$#" -ne 3 ]; then
  echo "Usage:   $0" '$base $cert_pem_file $cert_password' >&2
  echo "Example: $0" 'https://linkeddatahub.com/atomgraph/app/ ../../../certs/martynas.localhost.pem Password' >&2
  echo "Note: special characters such as $ need to be escaped in passwords!" >&2
  exit 1
fi

base="$1"
cert_pem_file=$(realpath -s "$2")
cert_password="$3"

pwd=$(realpath -s "$PWD")

pushd . && cd "$SCRIPT_ROOT"/imports

./import-csv.sh \
-b "$base" \
-f "$cert_pem_file" \
-p "$cert_password" \
--title "Categories" \
--query-file "$pwd/queries/imports/categories.rq" \
--file "$pwd/files/categories.csv" \
--action "${base}categories/"

./import-csv.sh \
-b "$base" \
-f "$cert_pem_file" \
-p "$cert_password" \
--title "Customers" \
--query-file "$pwd/queries/imports/customers.rq" \
--file "$pwd/files/customers.csv" \
--action "${base}customers/"

./import-csv.sh \
-b "$base" \
-f "$cert_pem_file" \
-p "$cert_password" \
--title "Employees" \
--query-file "$pwd/queries/imports/employees.rq" \
--file "$pwd/files/employees.csv" \
--action "${base}employees/"

./import-csv.sh \
-b "$base" \
-f "$cert_pem_file" \
-p "$cert_password" \
--title "Employee territories" \
--query-file "$pwd/queries/imports/employee_territories.rq" \
--file "$pwd/files/employee_territories.csv" \
--action "${base}employees/"

./import-csv.sh \
-b "$base" \
-f "$cert_pem_file" \
-p "$cert_password" \
--title "Orders" \
--query-file "$pwd/queries/imports/orders.rq" \
--file "$pwd/files/orders.csv" \
--action "${base}orders/"

./import-csv.sh \
-b "$base" \
-f "$cert_pem_file" \
-p "$cert_password" \
--title "Order details" \
--query-file "$pwd/queries/imports/order_details.rq" \
--file "$pwd/files/order_details.csv" \
--action "${base}orders/"

./import-csv.sh \
-b "$base" \
-f "$cert_pem_file" \
-p "$cert_password" \
--title "Products" \
--query-file "$pwd/queries/imports/products.rq" \
--file "$pwd/files/products.csv" \
--action "${base}products/"

./import-csv.sh \
-b "$base" \
-f "$cert_pem_file" \
-p "$cert_password" \
--title "Regions" \
--query-file "$pwd/queries/imports/regions.rq" \
--file "$pwd/files/regions.csv" \
--action "${base}regions/"

./import-csv.sh \
-b "$base" \
-f "$cert_pem_file" \
-p "$cert_password" \
--title "Shippers" \
--query-file "$pwd/queries/imports/shippers.rq" \
--file "$pwd/files/shippers.csv" \
--action "${base}shippers/"

./import-csv.sh \
-b "$base" \
-f "$cert_pem_file" \
-p "$cert_password" \
--title "Suppliers" \
--query-file "$pwd/queries/imports/suppliers.rq" \
--file "$pwd/files/suppliers.csv" \
--action "${base}suppliers/"

./import-csv.sh \
-b "$base" \
-f "$cert_pem_file" \
-p "$cert_password" \
--title "Territories" \
--query-file "$pwd/queries/imports/territories.rq" \
--file "$pwd/files/territories.csv" \
--action "${base}territories/"

popd
