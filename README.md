# adidas
Test app for adidas

Aplicación Adidas 1.0

Pese a que he dispuesto de un tiempo justo y me habría gustado recrearme un poco más dejo el proyecto con información 
de cada archivo, tecnologías, features usados en la APP etc.

Connection.php : Archivo con las credenciales para la conexión a la bbdd creada en mi hosting.

MySqlQueries.php : Archivo donde recojo las distintas consultas a la bbdd

(Segundo requisito de la prueba)
eventCongif.php : Archivo de configuración del evento para que la aplicación pueda ser extrapolable a otros eventos, 
en este archivo como se dejó a petición del developer los atributos del evento, he puesto que sean customizables el nombre 
del evento, la dirección y el logo/banner del evento. De esta manera cambiando esta info por ejemplo en la bbdd se actualizará 
en la app sin tener que hacer updates en los distintos stores. 

(Primer requisito de la prueba)
SaveUserInfo.php : Archivo que llamo cuando quiero guardar los campos recogídos en el formulario, como añadido hago una pequeña
comprobación en BD comprobando que el email introducido no existe previamente en la BD.
// Al no haber información de contenido privado como contraseñas o claves, he dedico no hacer ningún cifrado de los campos.

Con respecto al proyecto iOS, decir que normalmente para proyectos más grandes donde hay numerosas consultas a APIS suelo utilizar
Frameworks como SwiftyJson, Alamofire y para el cacheo de imágenes Haneke, pero al ser un proyecto donde solo existen un par de 
llamadas y una imagen, no lo ví necesario.

Por hacer algún añadido pese a la sencillez que tiene el formulario quise jugar con cada uno de los labels, añadiendo
datepickers, autocomplete para el caso del correo y las ciudades. Y distintas alertviews que nos irán informado de las
situaciones que nos encontremos.

En este proyecto he usado una arquitectura MVC y pese a que pocas eran las operaciones, he metido un par de unit 
test para comprobar la correcta creación de los botones Save & Cancel.

Resumen de las tecnologías usadas, PHP + SQL, y el proyecto se ha realizado en Swift 3.
