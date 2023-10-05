## 1. Commands

kubectl kustomize --enable-helm components/photon | kubectl apply --filename -

kubectl port-forward svc/photon -n photon 2322:2322

curl http://localhost:2322/api?q=riga

## 2. Download new countries
https://download1.graphhopper.com/public/extracts/by-country-code/

k get pods -n photon
k exec -it photon-6878bbb64-csbgv -n photon bash
wget --user-agent="$USER_AGENT" -O - https://download1.graphhopper.com/public/extracts/by-country-code/ee/photon-db-ee-latest.tar.bz2 | bzip2 -cd | tar x
kubectl delete pod photon-6878bbb64-csbgv 

### 2.1 How to download new country definition (e.g. Albania)
- No results
curl http://localhost:2322/api\?q\=tirana 

- Download Estonia definition
k get pods -n photon
k exec -it photon-6878bbb64-csbgv -n photon bash
wget --user-agent="$USER_AGENT" -O - https://download1.graphhopper.com/public/extracts/by-country-code/ee/photon-db-ee-latest.tar.bz2 | bzip2 -cd | tar x

- Restart photon 
kubectl delete pod photon-6878bbb64-csbgv 

### 2.2 Tests

- You should see results now
curl http://localhost:2322/api?q=opole

## Troubleshoots

If pod has pending status, then remove pvc and pv (cannot bound)

## Build photon elasticsearch indexes using nominatim

https://chringel.dev/2022/07/creating-a-google-maps-clone-part-2-geocoding-or-wheres-that-place/

jump to photon pod and run following code

java -jar photon.jar \
  -nominatim-import \
  -host localhost \
  -port 5433 \
  -database nominatim \
  -user nominatim \
  -password superSecretPassword \
  -languages en

# External postgres
java -jar photon.jar \
  -nominatim-import \
  -host postgres.svc \
  -port 5432 \
  -database nominatim \
  -user postgres \
  -password secure@pass \
  -languages en

# External elasticsearch and postgres 
java -jar photon.jar -cluster photon -transport-addresses elasticsearch.elasticsearch.svc:9200 -nominatim-import -host postgres.svc -port 5432 -database nominatim -user postgres -password secure@pass -languages en

