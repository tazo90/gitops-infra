https://www.bluematador.com/blog/safely-removing-pods-from-a-kubernetes-node

# 1. How to run entrypoint script from deployment file

  # deployment file

  command:

  - sh
  - c
  - | {{- .Values.photon.entrypoint | nindent 14 }}

  # values file

  photon:
    data_dir: "/photon/photon_data"
    entrypoint: |
      echo "run script"
