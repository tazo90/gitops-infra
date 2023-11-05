kubectl kustomize --enable-helm components/valhalla | kubectl apply --filename -

kubectl port-forward svc/valhalla 8002:8002

# Manual commands

bash /valhalla/scripts/run.sh build_tiles

# Setup tutorial (detailed)

https://water-gis.com/en/setups/valhalla/setup-valhalla/

# Test
curl http://localhost:8002/route \
--data '{"locations":[
              {"lat":42.56138,"lon":1.542170},
              {"lat":42.564561,"lon":1.59116}
           ],
         "costing":"auto"
        }'
