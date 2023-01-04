#!/bin/bash

# Ingresar a gitlab y generar un merge request

curl "http://gitserver.ggti.arba.gov.ar/kube/$2/merge_requests" -X POST -d '{"username": "hola", "password": "1234"}'

curl -v GET --header "$1" "http://gitserver.ggti.arba.gov.ar/kube/$2/merge_requests"
curl -v --location --request POST --header "$1" -H "Accept: application/json, text/plain, */*" -H "Content-Type: application/json" "http://gitserver.ggti.arba.gov.ar/kube/$2/merge_requests/$3/merge"

# estos no
curl -v GET -h "PRIVATE-TOKEN: glpat-9iT_pPmHrpf5yAJpNGmR" "https://gitlab.com/lucasAr9/taller-de-programacion/-/merge_requests/2"
curl -v --location --request PUT -H "PRIVATE-TOKEN: bvQL26Mi-n-n1QydsBz_" -H "Accept: application/json, text/plain, */*" -H "Content-Type: application/json" "https://gitlab.com/lucasAr9/taller-de-programacion/-/merge_requests/4/merge"

# este si
curl -v --location --request PUT -H "PRIVATE-TOKEN: glpat-8jbgF7ct1fXTA1UV7oB4" -H "Accept: application/json, text/plain, /" -H "Content-Type: application/json" "https://gitlab.com/api/v4/projects/32237196/merge_requests/4/merge"

# tocken de acceso
# glpat-8jbgF7ct1fXTA1UV7oB4
