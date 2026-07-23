$resultado = Invoke-RestMethod -Uri "https://api.open-meteo.com/v1/forecast?latitude=40.6617&longitude=-7.909&hourly=temperature_2m&timezone=auto&forecast_days=1&current=temperature_2m"
$opcao = Read-Host "Selecione 1 para ver o clima hora a hora, selecione 2 para ver o clima atual."
switch ($opcao) {
    1  {$porhora = for ($a=0; ($a -lt 24); $a++){
        [pscustomobject]@{
            Hora = $resultado.hourly.time[$a]
            "Temperatura em Celsius" = $resultado.hourly.temperature_2m[$a]
        }
    }
        $porhora} 
    2  {$atual = [PSCustomObject]@{
        "Dia e hora atuais" = $resultado.current.time
        "Temperatura atual em Celsius" = $resultado.current.temperature_2m
    }
        $atual} 
    default { "Ocorreu um erro na selecao." }
}