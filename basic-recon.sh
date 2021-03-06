/root/go/bin/subfinder -dL dominios.txt -all -o /root/Automatizacion/archivos/subfinder.txt;
python3 /root/tools/SubDomainizer/SubDomainizer.py -l dominios.txt -o /root/Automatizacion/archivos/subdomainizer.txt;
cat /root/Automatizacion/archivos/subfinder.txt /root/Automatizacion/archivos/subdomainizer.txt > /root/Automatizacion/archivos/todo.txt;
cat /root/Automatizacion/archivos/todo.txt | sort | uniq > /root/Automatizacion/archivos/todo_sindupe.txt;
cat /root/Automatizacion/archivos/todo_sindupe.txt | /root/go/bin/httprobe > /root/Automatizacion/archivos/activos.txt;
/root/go/bin/SubOver -l /root/Automatizacion/archivos/activos.txt > /root/Automatizacion/archivos/takeover.txt;
/root/go/bin/notify -data /root/Automatizacion/archivos/takeover.txt;
cat /root/Automatizacion/archivos/activos.txt /root/Automatizacion/subdominios.txt > /root/Automatizacion/archivos/todos_los_dominios.txt;
echo Buscando URLs | notify;
cat /root/Automatizacion/archivos/todos_los_dominios.txt | /root/go/bin/waybackurls | grep "=" | egrep -iv ".(jpg|jpeg|gif|css|tif|tiff|png|ttf|woff|woff2|icon|pdf|svg|txt|js)" > >
echo Buscaremos xss | notify;
cat /root/Automatizacion/archivos/urls_wayback.txt | /root/go/bin/kxss > /root/Automatizacion/archivos/kxss.txt;
cat /root/Automatizacion/archivos/kxss.txt | grep ">" > kxss_filtrado.txt;
/root/go/bin/notify -data /root/Automatizacion/archivos/kxss_filtrado.txt;
