https://www.bluematador.com/blog/safely-removing-pods-from-a-kubernetes-node

# 1. How to run entrypoint script from deployment file
https://stackoverflow.com/questions/70941212/including-shell-script-as-entrypoint-in-helm3
https://stackoverflow.com/questions/61473732/using-a-multi-line-shell-script-as-a-helm-value

  # deployment file

  command:
    - "/bin/bash"
    - "-c"
    - {{- toYaml .Values.photon.entrypoint | nindent 12 }}

  # values file

  photon:
    data_dir: "/photon/photon_data"
    entrypoint: |
      echo "run script"
