# Aplicación Imagenes Django y Vue

_Tecnologías utilizadas_:

* _API REST con Python, Django (https://www.djangoproject.com/) y Django REST Framework (https://www.django-rest-framework.org/)_
* _SPA (Single page aplication) con Javascript utilizando el Framework Vue (https://vuejs.org/)_

## Demo ⚙️

_En el siguiente enlace podrás encontrar la aplicación funcional: https://jeison130.github.io/upload-images/_

# Comenzando 🚀

## Requisitos 📋

_Para la ejecución del aplicativo deberás tener instalado en tu equipo las siguientes herramientas:_

### NodeJs 10.0.0 o superior

_Mediante el siguiente enlace https://nodejs.org/es/ podrá descarga NodeJS para el sistema operativo que este utilizando, se recomienda una versión de NodeJS 10 o superior_

### Git

_En el siguiente enlace, encontrará el instalador de Git, descargue la versión correspondiente a su sistema operativo: https://git-scm.com/_

### Vue

_Para instalar Vue, necesitaremos hacerlo mediante el CLI, por tal motivo, instala el paquete globalmente con el siguiente comando:_

```
npm install -g @vue/cli
```

### Python 3.5 o superior

_En la página principal de python: https://www.python.org/, podrás encontrar el instalador para tu sistema operativo_

## Instalación 🔧

_Como primer paso, necesitaremos clonar el repositorio, nos ubicamos en una carpeta de nuestro equipo, y mediante una consola ejecutamos el siguiente comando:_

```
git clone https://github.com/jeison130/upload-images.git
```

_Este comando nos creará una carpeta con el nombre **upload-images**, para lo cual mediante la consola ingresamos a esta carpeta con el siguiente comando:_

```
cd upload-images
```

### Python y Django

_Una vez nos encontremos en la carpeta de nuestro proyecto, deberemos crear un entorno virtual, para lo cual podemos ejecutar el comando:_

```
python -m venv env
```

_El anterior comando nos creará una carpeta **env** la cual contendrá el entorno virtual de python con el cual trabajaremos, y necesitaremos activarlo, para lo cual ejecutamos:_

```
env\Scripts\activate
```

_Con nuestro entorno virtual activo podemos proceder a instalar las dependencias necesarias para nuestro proyecto de Django, ingresamos con: **cd apiFileUpload** a nuestra api, y ejecutamos el comando:_

```
pip install -r requirements.txt
```
_Antes de poner en marcha nuestro servidor, será necesario crear nuestras varibles de entorno, para lo cual en la carpeta del proyecto de Django **apiFileUpload** creamos una copia del archivo .env.example, lo llamamos .env y lo pegamos en la misma ubicación, por ultimo, podemos ejecutar nuestras migraciones con el comando **python manage.py migrate** y correr nuestro servidor **python manage.py runserver**_

_Podemos acceder a desde nuestro navegador a la ruta http://localhost:8000/api/images/ y ver en funcionamiento nuestra api._

### Vue

_Para la configuración e instalación de frontend de nuestro proyecto, debemos ubicarnos dentro de la carpeta **frontend** y ejecutar el comando:_

```
npm install
```

_Una vez finalice la instalación de las dependencias, realizamos una copia del archivo .env.example que se encuentra en la carpeta **frontend** de nuestro proyecto, y lo llamamos .env, con esto podemos ejecutar el comando **npm run serve** y podras acceder en la ruta **http://localhost:8080**_