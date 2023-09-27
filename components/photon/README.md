# Build photon elasticsearch indexes using nominatim

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

# 1. Commands

kubectl kustomize --enable-helm components/photon | kubectl apply --filename -

kubectl port-forward svc/photon -n photon 2322:2322

curl http://localhost:2322/api?q=riga

# 2. Download new countries
https://download1.graphhopper.com/public/extracts/by-country-code/

k get pods -n photon
k exec -it photon-6878bbb64-csbgv -n photon bash
wget --user-agent="$USER_AGENT" -O - https://download1.graphhopper.com/public/extracts/by-country-code/ee/photon-db-ee-latest.tar.bz2 | bzip2 -cd | tar x
kubectl delete pod photon-6878bbb64-csbgv 

## 2.1 How to download new country definition (e.g. Albania)
- No results
curl http://localhost:2322/api\?q\=tirana 

- Download Estonia definition
k get pods -n photon
k exec -it photon-6878bbb64-csbgv -n photon bash
wget --user-agent="$USER_AGENT" -O - https://download1.graphhopper.com/public/extracts/by-country-code/ee/photon-db-ee-latest.tar.bz2 | bzip2 -cd | tar x

- Restart photon 
kubectl delete pod photon-6878bbb64-csbgv 

- You should see results now
curl http://localhost:2322/api\?q\=tirana 

## Troubleshots

If pod has pending status, then remove pvc and pv (cannot bound)


# 3. Description
Have your own geocoder up and running within the hour, you will require about 60GB of disk space and has no further dependencies. If you select a specific country, you can reduce the necessary disk space.

Feel free to fork and improve. 

See this [blog post](https://tonsnoei.nl/en/post/2023/03/20/set-up-your-own-geocoder-api/) for more info.


# Run

The image itself is pretty small, the first time the container is executed, a 60GB searchindex will be downloaded. The [blog post](https://tonsnoei.nl/en/post/2023/03/20/set-up-your-own-geocoder-api/) explains how to use only a specific country or region.

The data volume is exposed as `/photon/photon_data` and can be mounted, this way you'll only have to download the data once.

## With `docker run`

```bash
docker run -p 2322:2322 -it tonsnoei/photon-geocoder:latest
```

## Search

```
http://localhost:2322/api?q=amsterdam
```
*For more details on the API check the Photon [github repository](https://github.com/komoot/photon).*



## Build from git
https://github.com/tonsnoei/photon-docker

### With docker-compose
```bash
docker-compose build #optional
docker-compose up
```
*Note: if you abort the download, you have to remove the volume `photon_data` before restarting the container*


## FAQ

 - How do I pass arguments to the `photon.jar` ?

   *The entrypoint accepts arguments for the `photon.jar`, you can invoke it by using `docker exec`*
 - Do I need to have nominatim ?

   *The container downloads the latest prebuilt search index, there is no immediate need to have nominatim installed.*

 - What is Photon ?
  
   *Photon is a geocoder, check out [their website](https://photon.komoot.de/) and their [github repository](https://github.com/komoot/photon)*
