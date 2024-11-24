
#1. Carga los datos y examínalos en R. Emplea las funciones head(), summary(), dim() y str(). ¿Cuántas variables hay?
 ¿Cuántos tratamientos?
datos <- read.table("datos-trabajoR.txt", header = TRUE, sep = "\t")
head(datos)
summary(datos)
dim(datos)
str(datos)

#Hay 4 variables y 6 tratamientos diferentes


# 2. Hazunboxplot para nuestros datos. Uno para cada condición. Elige un color para cada condición y guárdalo para las
 siguientes gráficas.
png("boxplot.png")
boxplot(datos$Tratamiento, datos$Wildtype, datos$Sequia, datos$ExcesoRiego, 
        names = c("Tratamiento", "Wildtype", "Sequia", "ExcesoRiego"), 
        col = c("violet", "blue", "red", "green"),
        main = "Boxplot por Condición")



# 3. Haz dos gráficos de dispersión. El primero debe comparar Sequía con Wildtype, y el segundo ExcesoRiego con
 Wildtype. Cada tratamiento debe de ir de un color distinto. Pista: usa col=datos$Tratamiento.
#Sequía Vs Wildtype
plot(datos$Wildtype, datos$Sequia, 
     col = datos$Tratamiento, 
     xlab = "Wildtype", 
     ylab = "Sequía", 
     main = "Sequía vs Wildtype")

#ExcesoRiego Vs Wildtype
plot(datos$Wildtype, datos$ExcesoRiego, 
     col = datos$Tratamiento, 
     xlab = "Wildtype", 
     ylab = "ExcesoRiego", 
     main = "ExcesoRiego vs Wildtype")



# 4. Ponle leyenda al gráfico del apartado anterior. En el margen inferior derecho. Pista: investiga sobre legend().
legend("bottomright", 
       legend = unique(datos$Tratamiento), 
       col = unique(datos$Tratamiento), 
       pch = 1)


# 5. Hazunhistograma para cada variable. Recuerda mantener los colores. 
par(mfrow = c(1, 4))  
hist(datos$Tratamiento, col = "violet", main = "Histograma Tratamiento", xlab = "Tratamiento")
hist(datos$Wildtype, col = "blue", main = "Histograma Wildtype", xlab = "Wildtype")
hist(datos$Sequia, col = "red", main = "Histograma Sequía", xlab = "Sequía")
hist(datos$ExcesoRiego, col = "green", main = "Histograma ExcesoRiego", xlab = "ExcesoRiego")


# 6. Haz un factor en la columna tratamiento y guárdalo en una variable. Pista: factor(factor$Tratamiento).
factor_tratamiento <- factor(datos$Tratamiento)


# 7. Calcula la media y la desviación estándar para cada tratamiento. Recomendación: es más fácil si usas
 aggregate() o tapply(). 
aggregate(cbind(Wildtype, Sequia, ExcesoRiego) ~ Tratamiento, datos, mean)
aggregate(cbind(Wildtype, Sequia, ExcesoRiego) ~ Tratamiento, datos, sd)


# 8. Averigua cuántos elementos tiene cada tratamiento. Recomendación: es más fácil si usas table() con el factor
table(factor_tratamiento)


#  9. Extrae los datos para el tratamiento 1 y el tratamiento 4 y guárdalos cada uno en una variable diferente. 
tratamiento1 <- subset(datos, Tratamiento == 1)
tratamiento4 <- subset(datos, Tratamiento == 4)



# 10. Queremos comprobar que hay diferencias significativas para el tratamiento 1 y el tratamiento 5 entre Wildtype y
 Sequia, y entre Wildtype y ExcesoRiego. Primero, necesitaríamos comprobar si los datos se distribuyen de forma
 normal. En función de los resultados de la prueba de normalidad, ¿qué test usarías para cada comparativa? ¿Puedes
 comparar también Sequia con ExcesoRiego en ambos tratamientos? ** En general, asumimos que las muestras son
 independientes, pero ¿son sus varianzas iguales? Actúa de acuerdo con tus resultados.

tratamiento5 <- subset(datos, Tratamiento == 5)

shapiro.test(tratamiento1$Wildtype)
shapiro.test(tratamiento5$Wildtype)

shapiro.test(tratamiento1$Sequia)
shapiro.test(tratamiento5$Sequia) 

#como el valor de W, que indica la normalidad de los datos es inferior a 1 no seguirían los datos una distribución normal, por lo que las varianzas no serían iguales y descartaríamos el uso de métodos paramétricos. Usaríamos Wilcoxon / Kruskal-Wallis

#WT Vs Sequia
wilcox.test(tratamiento1$Wildtype, tratamiento1$Sequia)
wilcox.test(tratamiento5$Wildtype, tratamiento5$Sequia)


#WT Vs ExcesoRiego
wilcox.test(tratamiento1$Wildtype, tratamiento1$ExcesoRiego)
wilcox.test(tratamiento5$Wildtype, tratamiento5$ExcesoRiego)

#Sequia Vs ExcesoRiego
wilcox.test(tratamiento1$Sequia,tratamiento1$ExcesoRiego)
wilcox.test(tratamiento5$Sequia,tratamiento5$ExcesoRiego)

#Sucede para todas las comparaciones de los diferentes valores p que son < 0.05, entonces podemos rechazar la hipótesis nula. Esto quiere decir que hay una diferencia significativa entre las medias de los dos grupos comparados.



# 11. Realiza un ANOVA para comparar el tratamiento 1 en las tres condiciones. Pista: primero separa los valores de
 tratamiento1 en Wildtype, Sequia y ExcesoRiego en variables separadas. Luego fíjate en el archivo “datos
anova.txt” y trata de colocar los datos de esa forma en una tabla. Por último, ejecuta el test

tto_Wildtype <- tratamiento1$Wildtype
print(tto_Wildtype)

tto_Sequia <- tratamiento1$Sequia
print(tto_Sequia)

tto_ExcesoRiego <- tratamiento1$ExcesoRiego
print(tto_ExcesoRiego)

datosAnova <- data.frame("Condicion" = c("W","W","W","W","W","W","W","W","W","W","S","S","S","S","S","S","S","S","S","S","E","E","E","E","E","E","E","E","E","E"),"Valor"=c(tto_Wildtype, tto_Sequia, tto_ExcesoRiego))
anova <- aov(Valor ~ Condicion, data=datosAnova)
summary(anova)
