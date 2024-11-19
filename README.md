# proyecto_dask
Este es el proyecto de Dask para la materia de Fuentes de Datos ITAM Otoño 2024.

## Integrantes
- Andrés Álvarez
- Nicolás Álvarez
- Adolfo Yunez
- Pablo García

## Instrucciones para correr el proyecto
Recomendamos que realices este proceso con tiempo (no más de 10 minutos), ya que el repositorio es algo pesado y el Docker se tarda en construir.

### Clonar el repositorio desde GitHub
Accede a una carpeta donde desees guardar el proyecto y clona el repositorio con:
```bash
git clone git@github.com:Andresaf03/proyecto_dask.git
```
Ahora accede a la carpeta con: 
```bash
cd proyecto_dask
```

### Configurar el entorno de Docker
1. Reconstruye las imágenes de Docker
    - Asegúrate de que Docker esté instalado y en ejecución. Luego, ejecuta: 
    - Luego ejecuta:
    ```bash
        docker-compose build
    ```

2. Inicia los servicios
    - Inicia el contenedor con:
    ```bash
    docker-compose up
    ``` 
    - Esto expondrá:
        - Jupyter Lab en: http://localhost:8888
        - Dask Dashboard en: http://localhost:8787 (al igual que en 8880 8881 8882 8883 8889), es decir los clientes, una vez corridos con los diferentes notebooks, se expondran en dichos puertos. Se especifica con más detalles en el cuarto apartado.

### Acceder al proyecto y a los notebooks
Para acceder al proyecto, accede a Jupyter Lab a través del navegador en `http://localhost:8888`. Los notebooks están disponibles en el directorio notebooks/ dentro del contenedor. 

### Configurar el cliente Dask
En los notebooks (00-05), asegúrate de configurar un cliente Dask para habilitar el procesamiento distribuido. Este es el fragmento de código que está al principio de cada notebook, córrelo:
```python
from dask.distributed import Client

# Configurar el cliente
client = Client(n_workers = 2, threads_per_worker=4, memory_limit='1GB', dashboard_address=':puerto_determinado')

client  # Enlace al Dashboard de Dask
```
Esto imprimirá un enlace accesible desde el localhost en el puerto especificado con `dashboard_adress`, o bien, dentro de jupyterlab habrá una opción para abrirlo como un dashboard ahí mismo (se dividrá la pantalla).

### Sigue el proyecto
De esta forma, desde tu navegador en `http://localhost:8888` a través de Jupyter Lab puedes seguir el proyecto (notebooks 00-06). El código está pre-ejecutado, pero si quieres observar como funcionan los clientes necesitas ejecutarlo tú para que el código funcione.

## Estructura del Proyecto
```plaintext
proyecto_dask/
├── notebooks/          # Notebooks Jupyter para el proyecto (contiene igualmente los datos en `data` y las imágenes en `images`)
├── requirements.txt    # Dependencias del proyecto
├── docker-compose.yml  # Configuración de Docker Compose
├── Dockerfile          # Imagen Docker personalizada
└── README.md           # Documentación del proyecto
```
