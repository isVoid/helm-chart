  export DASK_SCHEDULER="127.0.0.1"
  export DASK_SCHEDULER_UI_IP="127.0.0.1"
  export DASK_SCHEDULER_PORT=8080
  export DASK_SCHEDULER_UI_PORT=8081
  kubectl port-forward --namespace default svc/my-release-dask-scheduler $DASK_SCHEDULER_PORT:8786 &
  kubectl port-forward --namespace default svc/my-release-dask-scheduler $DASK_SCHEDULER_UI_PORT:80 &

  export JUPYTER_NOTEBOOK_IP=$(kubectl get svc --namespace default my-release-dask-jupyter -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
  export JUPYTER_NOTEBOOK_PORT=80

  echo tcp://$DASK_SCHEDULER:$DASK_SCHEDULER_PORT               -- Dask Client connection
  echo http://$DASK_SCHEDULER_UI_IP:$DASK_SCHEDULER_UI_PORT     -- Dask dashboard
  echo http://$JUPYTER_NOTEBOOK_IP:$JUPYTER_NOTEBOOK_PORT       -- Jupyter notebook
