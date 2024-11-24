#############################################################################
#
# PRACTICA 1
#
# Expresión diferencial de genes de ratón
# Microarray de Affymetrix (Affymetrix Murine Genome U74A version 2 MG_U74Av2
# Origen de los datos: GEO GSE5583 (http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE5583)
# Publicación: Mol Cell Biol 2006 Nov;26(21):7913-28.  16940178 (http://www.ncbi.nlm.nih.gov/pubmed/16940178)
#
# Muestras: 3 Wild Type x 3 Histone deacetylase 1 (HDAC1)
#
# R código original (credits): Ahmed Moustafa
#
#
##############################################################################

# Instalar RCurl

# Si esto falla, que seguro lo hace tratar de instalarlo usando el menú, Paquetes, Servidor Spain A Coruña, RCurl

# Cargamos el paquete y los datos


# Chequeamos las dimensiones de los datos, y vemos las primeras y las últimas filas


# Hacemos un primer histograma para explorar los datos


# Transformamos los datos con un logaritmo 
# ¿Qué pasa si hacemos una transformación logarítima de los datos? ¿Para qué sirve?


# Hacemos un boxplot con los datos transformados. ¿Qué significan los parámetros que hemos empleado?
# ¿Qué es un boxplot?

# Hacemos un hierarchical clustering de las muestras basándonos en un coeficiente de correlación
# de los valores de expresión. ¿Es correcta la separación?


#######################################
# Análisis de Expresión Diferencial 
#######################################

# Primero separamos las dos condiciones. ¿Qué tipo de datos has generado?

# Calcula las medias de las muestras para cada condición. Usa apply


# ¿Cuál es la media más alta?


# Ahora hacemos un scatter plot (gráfico de dispersión)


# Añadir una línea diagonal con abline


# ¿Eres capaz de añadirle un grid?


# Calculamos la diferencia entre las medias de las condiciones

# Hacemos un histograma de las diferencias de medias

# Calculamos la significancia estadística con un t-test.
# Primero crea una lista vacía para guardar los p-values
# Segundo crea una lista vacía para guardar las estadísticas del test.
# OJO que aquí usamos los datos SIN TRANSFORMAR. ¿Por qué?
# ¿Cuántas valores tiene cada condición?




# Ahora comprobamos que hemos hecho TODOS los cálculos


# Hacemos un histograma de los p-values.
# ¿Qué pasa si le ponemos con una transformación de -log10?


# Hacemos un volcano plot. Aquí podemos meter la diferencia de medias y la significancia estadística

# Queremos establecer que el mínimo para considerar una diferencia significativa, es con una diferencia de 2 y un p-value de 0.01
# ¿Puedes representarlo en el gráfico?

# Ahora buscamos los genes que satisfagan estos criterios
# Primero hacemos el filtro para la diferencia de medias (fold)


# Ahora el filtro de p-value


# Ahora las combinamos. ¿Cuántos genes cumplen los dos criterios?


# Ahora generamos otro volcano plot con los genes seleccionados marcados en rojo


# Ahora vamos a marcar los que estarían sobreexpresados (rojo) y reprimidos (azul). ¿Por qué parece que están al revés?

# Ahora vamos a generar un mapa. Para ello primero tenemos que hacer un cluster de las columnas y los genes 
# ¿Qué es cada parámetro que hemos usado dentro de la función heatmap?
# ¿Eres capaz de cambiar los colores del heatmap? Pista: usar el argumento col y hcl.colors


# Ahora vamos a crear un heatmap más chulo. Para ello necesitamos dos paquetes: gplots y RcolorBrewer



# Hacemos nuestro heatmap
	


# Guardamos los genes diferencialmente expresados y filtrados en un fichero



#Rowv=determines if and how the row dendrogram should be reordered. 
#Colv=determines if and how the column dendrogram should be reordered. 
#scale=indicates if the values should be centered and scaled in either the row direction or the column direction

# Lo guardamos en un archivo PDF


# Guardamos los genes diferencialmente expresados y filtrados en un fichero
