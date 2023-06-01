# FILEPATH: c:\kafka\go.ps1

# Supprimer les fichiers kafka pour démarrer from scratch
# si ils existent
if (Test-Path "c:\tmp\zookeeper") {
    Remove-Item -Path "c:\tmp\zookeeper" -Recurse -Force
}
if (Test-Path "c:\tmp\kafka-logs") {
    Remove-Item -Path "c:\tmp\kafka-logs" -Recurse -Force
}

# lancement de ZOOKEEPER
wt -w 0 -d $Env:KAFKA_HOME\bin\windows pwsh -NoExit { .\zookeeper-server-start.bat ..\..\config\zookeeper.properties }
# attente 2 secondes
Start-Sleep -Seconds 2

# lancement du BROKER
wt -w 0 -d $Env:KAFKA_HOME\bin\windows pwsh -NoExit { .\kafka-server-start.bat ..\..\config\server.properties }
# attente 2 secondes
Start-Sleep -Seconds 2

# lancement du producer genkp
wt -w 0 -d $Env:KAFKA_HOME\genkp pwsh -NoExit { .\run.cmd }
# attente 2 secondes
Start-Sleep -Seconds 2

# lancement du consumer kc-etudiants
wt -w 0 -d $Env:KAFKA_HOME\kc-etudiants pwsh -NoExit { .\run.cmd }

# vous pouvez accéder au service swagger via http://localhost:7000/swagger-ui.html
