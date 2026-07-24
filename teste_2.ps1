$nomecidade = Read-Host "Introduz o nome da cidade desejada. Se houver algum espaco, separe com +."
$resultadocidade = Invoke-RestMethod -Uri "https://geocoding-api.open-meteo.com/v1/search?name=$nomecidade&count=1&language=en&format=json"
$lat = $resultadocidade.results.latitude
$lon = $resultadocidade.results.longitude
$resultado = Invoke-RestMethod -Uri "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&hourly=temperature_2m,rain&current=temperature_2m,rain&timezone=auto&forecast_days=1"
$zonahoraria = $resultado.timezone
$opcao = Read-Host "Selecione 1 para ver o clima hora a hora, selecione 2 para ver o clima atual."
switch ($opcao) {
    1  {$porhora = for ($a=0; ($a -lt 24); $a++){
        [pscustomobject]@{
            Hora = $resultado.hourly.time[$a]
            "Temperatura em Celsius" = $resultado.hourly.temperature_2m[$a]
            "Chuva" = $resultado.hourly.rain[$a]
        }
    }
        $porhora |
        Tee-Object -FilePath ..\OutputsClima\OutputPorHora.txt
        "Zona horaria: $zonahoraria" |
        Tee-Object -FilePath ..\OutputsClima\OutputPorHora.txt -Append} 
    2  {$atual = [PSCustomObject]@{
        "Dia e hora atuais" = $resultado.current.time
        "Temperatura atual em Celsius" = $resultado.current.temperature_2m
        "Chuva" = $resultado.current.rain
    }
        $atual |
        Tee-Object -FilePath ..\OutputsClima\OutputAtual.txt
        "Zona horaria: $zonahoraria" |
        Tee-Object -FilePath ..\OutputsClima\OutputAtual.txt -Append} 
    default { "Ocorreu um erro na selecao." }
}
