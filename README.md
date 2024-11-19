# proyecto_dask
Este es el proyecto de Dask para la materia de Fuentes de Datos ITAM Otoño 2024.

## Integrantes
- Andrés Álvarez
- Nicolás Álvarez
- Adolfo Yunez
- Pablo García

## Instrucciones para correr el proyecto
Recomendamos que realices este proceso con tiempo (no más de 10 minutos), ya que el repositorio es algo pesado y el Docker se tarda en construir. 

### Hacer un Fork del repositorio
En el GitHub del proyecto, haz click en el botón de **Fork** que se encuentra por la esquina superior derecha (esto es necesario para que puedan subir su tarea). A partir de aquí, elige un nombre (recomendamos que sea *proyecto_dask*) y selecciona la opción de copiar solamente la rama `master/main`. Así, tendrás un fork de nuestro repositorio en tu GitHub, el cual podrás clonar y desde el cuál podrás hacer el pull request para la tarea.

### Clonar el repositorio desde GitHub
Accede a una carpeta donde desees guardar el proyecto y clona el repositorio de tu fork con:
```bash
git clone git@github.com:tu_usuario/proyecto_dask.git
```
Sustituye, si decidiste usar otro nombre para el repositorio, en *proyecto_dask* tanto arriba como abajo.

Ahora accede a la carpeta con: 
```bash
cd proyecto_dask
```

Igualmente, para la tarea, por si se modifica algo, recomendamos que configures el upstream. Estando dentro de la carpeta en el repositorio de tu fork (paso anterior), puedes hacerlo con:
```bash
git remote add upstream git@github.com:Andresaf03/proyecto_dask.git
```

### Configurar el entorno de Docker
Si vas a seguir el proyecto de manera local (no recomendamos) y no quieres construir el Docker, es necesario que construyas el ambiente virtual (`.venv`) desde tu editor de código. En VS Code simplemente pulsa `CONTROL + SHIFT + P` -> `>Create Environment` -> `Venv` -> Seleccionar tu intérpete de python -> seleccionar la casilla de `requirements.txt` -> `ENTER`. De esta forma se creará un ambiente virtual local con las dependencias necesarias para seguir el proyecto, puedes saltarte este paso y verás el proyecto dentro de la carpeta `/notebooks`. En otro caso, sige las instrucciones a continuación:

1. Reconstruye las imágenes de Docker
    - Asegúrate de que Docker esté instalado y en ejecución. Colócate en la carpeta *proyecto_dask*. 
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

## Tarea
Para la tarea, es necesario que consultes el archivo `06_tarea_dask.ipynb`. Dentro de este se encuentran todas las instrucciones de la tarea. Una vez realizado el 'fork' y clonado el repositorio, crea una rama en tu fork y agrega una carpeta con tu clave única en la carpeta de tareas. Copia el archivo `06_tarea_dask.ipynb` de la carpeta de notebooks y agrégalo a tu carpeta. Resuelve la tarea (dentro de tu carpeta) y haz pull request al main de nuestro repositorio (desde tu main). Este es el mismo procedimiento que hemos seguido en la clase de Fuentes de Datos.