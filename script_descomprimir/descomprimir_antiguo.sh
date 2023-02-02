#!/bin/bash


# Parámetro de entrada $1= Fecha (formato YYYYMMDD)

pathLog=/home/operctlm
directorio=$1
fecha=$1
odate=$(echo $1 | cut -c 3-8)  # ejemplo 20221201 -> 221201
log2=$pathLog/$(date +"%Y%m%d_%H%M%S")_control.log

echo "#############################################################"  >> $log2
echo $(date +"%Y%m%d_%H%M%S")                                         >> $log2
echo " "                                                              >> $log2

procese=0


################################################################
pathwork=/Proyectosweb/ARPresentaciones/SIRTAC
###### AG047 >>
if ls $pathwork/AG047/$1/*.zip 1> /dev/null 2>&1 ; then
    # 2>&1 dice enviar un error estándar a donde siempre se redirige la salida estándar.
    # Lo cual, ya que se está enviando en /dev/null es similar a ignorar cualquier salida.
    let procese++
    find $pathwork/AG047/$1/*.zip -exec unzip -joq {} -d $pathwork \;   >> $log2
    nroerror=$?
#  echo ">>>>>>>>>>>> Borro .zip."                                                 >> $log2
#  find $pathwork/AG047/$1/*.zip -exec rm -f {}  \;                                >> $log2
    echo "Hay archivos AG047."
    echo ">>>>>>>>>>>> Genero Control_wc.log."                                  >> $log2
    wc -l $pathwork/*.txt                                                       >> $log2
    wc -l $pathwork/*.txt                                                       >> $pathLog/AG047_control_wc.log

# AG047
#    sirtac_cabecera_ext
#    sirtac_detalles_ext
#    sirtac_acreditaciones_ext
#    sirtac_intereses_ext

else
    echo "#############################################################"          >> $log2
    echo "No se encontro archivo .zip [$pathwork/AG047/$1/*.zip], para procesar." >> $log2
    echo "#############################################################"          >> $log2
fi


################################################################
pathwork=/Proyectosweb/ARPresentaciones/SIRCREB
###### AG047 <<
###### IG032 >>
if ls $pathwork/IG032/$1/*.zip 1> /dev/null 2>&1 ; then
    let procese++
    find $pathwork/IG032/$1/*.zip -exec unzip -joq {} -d $pathwork \;       >> $log2
    nroerror=$?
#  echo ">>>>>>>>>>>> Borro .zip."                                             >> $log2
#  find $pathwork/AG047/$1/*.zip -exec rm -f {}  \;                            >> $log2
    echo "Hay archivos IG032."
    echo ">>>>>>>>>>>> Genero Control_wc.log."                              >> $log2
    wc -l $pathwork/*.txt                                                   >> $log2
    wc -l $pathwork/*.txt                                                   >> $pathLog/IG032_control_wc.log

else
    echo "#############################################################"            >> $log2
    echo "No se encontro archivo .zip [$pathwork/IG032/$1/*.zip], para procesar."   >> $log2
    echo "#############################################################"            >> $log2
fi


################################################################
###### IG032 <<
if [ $procese = 0 ]; then
    echo "#########################################################"      >> $log2
    echo " No se encontraron archivos .zip. [procese= $procese]"          >> $log2
    echo "#########################################################"      >> $log2
    exit 1
else
    echo " "                                                              >> $log2
    echo "################################################"               >> $log2
    exit $nroerror
fi
