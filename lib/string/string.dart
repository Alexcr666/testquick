import 'package:testquick/main.dart';
import 'package:testquick/utils/utils.dart';

String lenguaje;
String cargando = lenguaje == "es_ES" ? "Cargando" : "Loading";

String nombreCompletoString =
lenguaje == "es_ES" ? "Nombre Completo" : "Full name";
String stringEmpresa = lenguaje == "es_ES" ? "Empresa" : "Business";
String stringDescripcionPerfil =
lenguaje == "es_ES" ? "Descripción perfil" : "Profile description";
String stringTelefono = lenguaje == "es_ES" ? "Telefono" : "Telephone";
String stringCorreo = lenguaje == "es_ES" ? "Correo" : "Email";
String stringCorreotxt = lenguaje == "es_ES" ? "Correo" : "Email";
String stringDireccion = lenguaje == "es_ES" ? "Dirección" : "Direction";
String stringClave = lenguaje == "es_ES" ? "Contraseña" : "Password";
String stringClavetxt = lenguaje == "es_ES" ? "Contraseña" : "Password";
String stringNuevaClave =
lenguaje == "es_ES" ? "Nueva Contraseña" : "New Password";
String stringSaved = lenguaje == "es_ES" ? "Guardar" : "Saved";

String stringConfirmarClave =
lenguaje == "es_ES" ? "Confirmar contraseña" : "Confirm Password";
String stringPerfil = lenguaje == "es_ES" ? "PERFIL" : "PROFILE";
String stringWtbRequest = "WTB REQUEST";


String stringTypeOfRequest =
lenguaje == "es_ES" ? "TIPO DE REQUERIMIENTO" : "TYPE OF REQUEST";
String stringntq = "NTQ";
String stringHardC = "HARD C";
String stringMedC = "MED C";
String stringSoftC = "SOFT C";
String stringSoldOrder = lenguaje == "es_ES" ? "ORDEN VENDIDA" : "SOLD ORDER";
String stringProductStatus =
lenguaje == "es_ES" ? "ESTADO PRODUCTO" : "PRODUCT STATUS";
String stringRenovar = lenguaje == "es_ES" ? "RENOVAR" : "RENEW";
String stringEditar = lenguaje == "es_ES" ? "EDITAR" : "EDIT";
String stringEliminar = lenguaje == "es_ES" ? "ELIMINAR" : "DELETE";
String stringFiler = lenguaje == "es_ES" ? "FILTRAR" : "FILTER";
String stringView = lenguaje == "es_ES" ? "VER" : "VIEW";
String stringOrder = lenguaje == "es_ES" ? "ORDERNAR" : "ORDER";
String stringnew = lenguaje == "es_ES" ? "NUEVO" : "NEW";
String stringSlider = lenguaje == "es_ES" ? "SLIDER" : "SLIDER";
String stringUsed = lenguaje == "es_ES" ? "USADO" : "USED";
String stringCampoRequerido =
lenguaje == "es_ES" ? "Campo requerido" : "Required field";
String stringRevisaTuCorreoElectronico =
lenguaje == "es_ES" ? "Revisa tu correo electrónico" : "Check your email";
String stringFaltaEstadoProducto =
lenguaje == "es_ES" ? "Falta el estado del reloj" : "Watch status missing";

String stringFaltaImagen =
lenguaje == "es_ES" ? "Falta la imagen principal" : "Main image missing";
String stringFaltaFechaDeCompra = lenguaje == "es_ES"
    ? "Falta la fecha de compra"
    : "The purchase date is missing";

String stringHoras = lenguaje == "es_ES" ? "Horas" : "Hours";
String stringComplete = lenguaje == "es_ES" ? "COMPLETO" : "COMPLETE";
String stringWhatCard =
lenguaje == "es_ES" ? "RELOJ Y TARJETA" : "WATCH & CARD";
String stringNaked = "NAKED";
String stringReportes = lenguaje == "es_ES" ? "REPORTES" : "REPORTS";
String stringInventaryCost =
lenguaje == "es_ES" ? "PRECIO INVENTARIO" : "INVENTORY COST";
String stringStock = "STOCK";
String stringOldesItem =
lenguaje == "es_ES" ? "ARTICULO MAS ANTIGUO" : "OLDEST ITEM";
String stringAverage =
lenguaje == "es_ES" ? "INVENTARIO PROMEDIO" : "AVERAGE INVENTORY";
String stringRelojEliminado =
lenguaje == "es_ES" ? "Reloj eliminado" : "Watch delete";
String stringNuevaSimilitud = lenguaje == "es_ES"
    ? "Tienes una nueva similitud"
    : "You have a new similarity";

String stringDays = lenguaje == "es_ES" ? "DIAS" : "DAYS";
String stringItems = "ITEMS";
String stringUploadImages =
lenguaje == "es_ES" ? "SUBIR IMAGEN" : "UPLOAD IMAGES";
String favorCompletarElCampoString = lenguaje == "es_ES"
    ? "Porfavor complete los campos"
    : "Please complete the field";
String stringEntrar = lenguaje == "es_ES" ? "Ingresar" : "Log in";
String stringPrivate = lenguaje == "es_ES" ? "PRIVADO" : "PRIVATE";
String stringHold = lenguaje == "es_ES" ? "SOSTENER" : "HOLD";
String stringMemo = "MEMO";
String stringAvailable = lenguaje == "es_ES" ? "DISPONIBLE" : "AVAILABLE";
String stringSold = lenguaje == "es_ES" ? "VENDIDA" : "SOLD";
String stringPurchase =
lenguaje == "es_ES" ? "FECHA DE COMPRA" : "Purchase Date";
String stringAddNewRequest =
lenguaje == "es_ES" ? "AGREGAR REQUERIMIENTO" : "ADD NEW REQUEST";
String stringModifiRequest =
lenguaje == "es_ES" ? "MODIFICAR REQUERIMIENTO" : "MODIFY REQUEST";
String stringSendRequest =
lenguaje == "es_ES" ? "ENVIAR REQUERIMIENTO" : "SEND REQUEST";
String stringBrand = lenguaje == "es_ES" ? "MARCA" : "BRAND";
String stringModel = lenguaje == "es_ES" ? "MODELO" : "MODEL";
String stringReference = lenguaje == "es_ES" ? "REFERENCIA" : "REFERENCE";
String elegirGaleriaString =
lenguaje == "es_ES" ? "Elegir de la galeria" : "Choose from gallery";
String tomarFotoString = lenguaje == "es_ES" ? "TAKE PHOTO" : "Tomar Foto";
String stringCancelar = lenguaje == "es_ES" ? "Cancelar" : "Cancel";
String stringInventario = lenguaje == "es_ES" ? "INVENTARIO" : "INVENTORY";
String stringAddWatch = lenguaje == "es_ES" ? "AGREGAR RELOJ" : "ADD WATCH";
String stringClaveRecordatorio = lenguaje == "es_ES"
    ? "Su contraseña debe contener al menos 8 caracteres, un número, una letra mayúscula y un carácter especial"
    : "Your password must contain at least 8 characters,one number,one upper case letter and one special characters.";
String stringHaceFaltaUnCampo =
lenguaje == "es_ES" ? "Hace falta un campo" : "A field is needed";

String stringModificarPerfil =
lenguaje == "es_ES" ? "MODIFICAR PERFIL" : "MODIFY PROFILE";
String notificacionString =
lenguaje == "es_ES" ? "NOTIFICACION" : "NOTIFICATION";
String datosIngresadosCorrectamenteString =
lenguaje == "es_ES" ? "Datos ingresados" : "Data entered";
String datosIconrrectosString =
lenguaje == "es_ES" ? "Datos incorrectos" : "Incorrect data";
String claveMenor = lenguaje == "es_ES"
    ? "Contraseña debe ser mayor a 6 caracteres"
    : "Password must be greater than 6 characters";
String claveCambiadaExitosamente = lenguaje == "es_ES"
    ? "Clave cambiada exitosamente"
    : "Password changed successfully";
String claveErrorString =
lenguaje == "es_ES" ? "Clave error" : "Password error";
String claveActualIncorrectaString =
lenguaje == "es_ES" ? "Clave actual incorrecta" : "Current password error";
String stringEliminarDescripcion = lenguaje == "es_ES"
    ? "Seguro que quieres eliminar"
    : "Are you sure you want to delete it";
String claveActualString =
lenguaje == "es_ES" ? "Contraseña actual" : "Current password";
String stringBusqueda = lenguaje == "es_ES" ? "Busqueda" : "Search";
String stringMiNombreEs = lenguaje == "es_ES" ? "Mi nombre es " : "My name is ";
String stringEstoyInteresadoEnElReloj = lenguaje == "es_ES"
    ? "y estoy interesado en el reloj"
    : "and I'm interested in the watch";
String stringContactoCompartido = lenguaje == "es_ES"
    ? "Tu contacto ha sido compartido con "
    : "Your contact has been shared with";
String stringTotal = lenguaje == "es_ES" ? "Total" : "Total";
String stringVentas = lenguaje == "es_ES" ? "Ventas" : "Sales";
String stringDisponible = lenguaje == "es_ES" ? "Disponible" : "Available";

String stringOperacionExitosa =
lenguaje == "es_ES" ? "Operación exitosa" : "Successful Operation";
String claveConfirmarString =
lenguaje == "es_ES" ? "Confirmar contraseña" : "Confirm password";
String stringFechaInicio = lenguaje == "es_ES" ? "Fecha Inicio" : "Start date";
String stringFechaFinal = lenguaje == "es_ES" ? "Fecha final" : "Final date";
String stringFechaIniciotxt =
lenguaje == "es_ES" ? "Fecha Inicio" : "Start date";
String stringFechaFinaltxt = lenguaje == "es_ES" ? "Fecha final" : "Final date";
String noConexionInternet = lenguaje == "es_ES"
    ? "No hay conexión a internet"
    : "There is no Internet conection";
String claveNoCoinciden = lenguaje == "es_ES"
    ? "Las contraseña no coinciden"
    : "The password does not match";
String stringFecha = lenguaje == "es_ES" ? "Fecha" : "Date";
String stringContacto = lenguaje == "es_ES"
    ? "Tu contacto ha sido compartido"
    : "Your contact data has beeen sent";

String stringNoResultados =
lenguaje == "es_ES" ? "No hay resultados" : "No results";
String stringCost = lenguaje == "es_ES" ? "Costo" : "Cost";
String stringExpiresIn = lenguaje == "es_ES" ? "EXPIRA EN" : "EXPIRES IN";
String stringCelular = lenguaje == "es_ES" ? "Telefono" : "Phone";
String stringAceptarTerminos = lenguaje == "es_ES"
    ? "Aceptar terminos y condiciones"
    : "Accept terms and conditions";
String errorNotificacionString =
lenguaje == "es_ES" ? "Ha ocurrido un error" : "An error has occurred";
String acepteTerminosString =
lenguaje == "es_ES" ? "Acepte los terminos" : "Accept the terms";
String stringEnviar = lenguaje == "es_ES" ? "ENVIAR" : "Send";
String stringReportesAVentas = lenguaje == "es_ES"
    ? "Reportes cambio a ventas"
    : "Reports change to sales";
String stringReportesADisponible = lenguaje == "es_ES"
    ? "Reportes cambio a disponible"
    : "Reports change to available";
String stringReportesTotales = lenguaje == "es_ES"
    ? "Reporte cambio a totales"
    : "Report change to totals";

String stringNombreCompleto =
lenguaje == "es_ES" ? "Nombre completo" : "Full name";
String recordadoClaveString = lenguaje == "es_ES" ? "Repetir" : "Remember";
String revisaBandejaString = "Check the tray";

String hasOlvidadoTuClave = lenguaje == "es_ES"
    ? "Recuperar contraseña"
    : "have you forgotten your password?";
String stringRegistrarse = lenguaje == "es_ES"
    ? "Registrate aquí"
    : "Sign up here";
String stringRegistrarsetxt = lenguaje == "es_ES" ? "Registrate" : "Sign up";
String stringRecuperarClave =
lenguaje == "es_ES" ? "Forgot password?" : "¿Se te olvidó tu contraseña?";
String stringEliminarFoto =
lenguaje == "es_ES" ? "Eliminar foto" : "Delete photo";
String stringRenovar2 = lenguaje == "es_ES" ? "RENOVAR" : "RENEW";
String stringExpired = lenguaje == "es_ES" ? "EXPIRADO" : "EXPIRED";

String stringComenzar = lenguaje == "es_ES" ? "d" : "Comenzar";

String claveNuevaString =
lenguaje == "es_ES" ? "Nueva contraseña" : "New password";
String favordigitarelcampoString =
lenguaje == "es_ES" ? "" : "Please enter the field";
String maximoString =
lenguaje == "es_ES" ? "Maximo 500 caracteres" : "Maximum 500 characters";
String stringNew = lenguaje == "es_ES" ? "Nuevo" : "New";
String stringCambiarClave =
lenguaje == "es_ES" ? "Cambiar contraseña" : "Change password";
String stringDescripcion = lenguaje == "es_ES" ? "Descripcion" : "Description";
String stringAddInventory =
lenguaje == "es_ES" ? "Agregar inventario" : "Add Inventory";
String stringSerie = lenguaje == "es_ES" ? "Serie" : "Serie";
String stringNoRecomendado =
lenguaje == "es_ES" ? "No recomendado" : "NOT RECOMENDED";
String stringHoldTo = lenguaje == "es_ES" ? "Atenerse a " : "Hold to";
String stringSoldTo = lenguaje == "es_ES" ? "Vendido a " : "Sold to";
String stringConfirmacionGuardado = lenguaje == "es_ES"
    ? ""
    : "The watch series is missing, you want to save like this";
String stringAceptar = lenguaje == "es_ES" ? "Aceptar" : "To accept";
//String stringCancelar = "";
String stringSollingPrice =
lenguaje == "es_ES" ? "Precio de venta" : "Selling price";
String stringSoldFor = lenguaje == "es_ES" ? "Vendido para" : "Sold For";
String stringBought = lenguaje == "es_ES" ? "Compro" : "Bought from";
String stringMemoTo = lenguaje == "es_ES" ? "Memo a" : "Memo to";
String stringMinimoImagen = lenguaje == "es_ES"
    ? "Se requiere mínimo una imagen"
    : "Minimum one image is required";
String stringMaxAno = lenguaje == "es_ES" ? "Ultimo año" : "Last year";
String stringNoTienesCuenta =
lenguaje == "es_ES"
    ? "Si no tienes una cuenta,"
    : "if you don't have an account";
String stringDeseaSalirSinGuardar = lenguaje == "es_ES"
    ? "Desea salir sin guardar"
    : "You want to exit without saving";
String stringCondicion1CrearCuenta =
lenguaje == "es_ES"
    ? "Nombre completo debe ser mayor a 5 caracteres"
    : "Full name must be greater than 5 characters";
String stringCondicion2CrearCuenta = lenguaje == "es_ES"
    ? "Email invalido"
    : "Invalid email";
String stringCondicion3CrearCuenta = lenguaje == "es_ES"
    ? "Telefono invalido"
    : "Invalid phone";

String stringFaltanInformacionCompra = lenguaje == "es_ES"
    ? "Falta información de compra"
    : "Purchase information is missing";
String stringFaltaEstadoDelReloj = lenguaje == "es_ES"
    ? "Falta el estado del reloj"
    : "Clock status missing";
String stringFaltaFechaReloj = lenguaje == "es_ES"
    ? "Falta la fecha del reloj"
    : "Clock date is missing";
String stringRecuperarClavetxt = lenguaje == "es_ES"
    ? "Recuperar clave"
    : "Recover password";
String stringFinalizar = lenguaje == "es_ES" ? "Finalizar" : "Finish";
String stringIntroducionTitulo1 = lenguaje == "es_ES"
    ? "Cambia tus reportes"
    : "Change your reports";
String stringIntroducionDescripcion1 = lenguaje == "es_ES"
    ? "Click para cambiar tus reportes a ventas,disponible y totales"
    :"Click to change your reports to sales, available and totals";
String stringIntroducionTitulo2 = lenguaje == "es_ES"
    ? "Cambia tus reportes por fechas"
    : "Click to change your reports to sales, available and totals";
String stringIntroducionDescripcion2 = lenguaje == "es_ES"
    ? "Click para cambiar tus reportes por diferentes fechas"
    : "Click to change your reports for different dates";


String stringIntroducionTitulo3 = lenguaje == "es_ES"
    ? "Crea tu primer requerimiento"
    : "Create your first requirement";
String stringIntroducionDescripcion3 = lenguaje == "es_ES"
    ? "Click para crear tu primer requerimiento"
    : "Click to create your first request";
String stringIntroducionTitulo4 = lenguaje == "es_ES"
    ? "Crea tu primer reloj"
    : "Create your first watch";
String stringIntroducionDescripcion4 = lenguaje == "es_ES"
    ? "Click para crear tu primer reloj en el inventario"
    : "Click to create your first watch in inventory";
String stringIntroducionTitulo5 = lenguaje == "es_ES"
    ? "Edita tu perfil"
    : "Edit your profile";
String stringIntroducionDescripcion5 = lenguaje == "es_ES"
    ? "Click para editar tu información de perfil"
    : "Click to edit your profile information";
String stringFaltaTipoRequerimiento = lenguaje == "es_ES"
    ? "Falta el tipo de requerimiento"
    : "Watch request type is missing";
String stringFaltaElNombreReloj = lenguaje == "es_ES"
    ? "Falta la marca"
    : "The mark is missing";
String stringFaltaLaSerie = lenguaje == "es_ES"
    ? "Falta la serie"
    : "The series is missing";
String stringFaltaElModelo = lenguaje == "es_ES"
    ? "Falta el modelo"
    : "The model is missing";
String stringFaltaReferencia = lenguaje == "es_ES"
    ? "Falta la referencia"
    : "The reference is missing";
String stringFaltaElCosto = lenguaje == "es_ES"
    ? "Falta el costo"
    : "Cost is missing";
String stringFaltaPrecioVenta = lenguaje == "es_ES"
    ? "Falta el precio de venta"
    : "The sale price is missing";
String stringFaltaVendidoPara = lenguaje == "es_ES"
    ? "Falta vendido para"
    : "Missing sold for";
String stringFaltaCompradoEn = lenguaje == "es_ES"
    ? "Falta comprado en"
    : "Missing bought in";
String stringFaltaCorreo = lenguaje == "es_ES"
    ? "Falta el correo electronico"
    : "Email is missing";
String stringTelefonoMayorA = lenguaje == "es_ES"
    ? "Telefono debe ser mayor a 7 digitos"
    : "Phone must be greater than 7 digits";

String stringFaltaClave = lenguaje == "es_ES"
    ? "Falta la contraseña"
    : "Password is missing";
String stringPerfilActualizado = lenguaje == "es_ES"?"Perfil actualizado":"Profile updated";
String stringEnviarMensaje = "Enviar Mensaje";
String stringChats = "Chats";
String stringAppName = "TestQuick";
String stringGrabando = "Grabando..";





