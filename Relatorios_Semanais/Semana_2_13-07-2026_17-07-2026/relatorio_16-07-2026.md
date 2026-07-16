# Hoje, dia 16/07/2026, editei o exercício feito anteriormente para que o html buscasse informações diretamente no backend.

### -Primeiro, tentei utilizar o antigo string de server.js:
	app.get("/api/hello", (req, res) => {
  	res.json({ message: "O backend está a funcionar." });
	});
### mudando o message pelos elementos html, mas sempre dava erro de sintaxe. Fui aos links fornecidos e tentei solventar.
### -Após a leitura do segundo link, tentei várias formas de realizar o exercício, mas acababa por sair um erro de formatacao ao tentar iniciar o container do backend.
### -Finalmente após varias pesquisas percebi que era preciso definir uma const do backend:
    const aboutme = `...`"
### onde iria o código html inteiro, de seguida utilizar um string muito parecido com o antigo, mas invés de ser res.json({message: "...."}) devia ser res.json({ html: ... }) para definir a const como html.
### -Assim, introduzi as informacoes de cada separador no backend utilizando a lógica aprendida.
### -No frontend, editei cada separador do cv para buscar as informacoes no backend invés de ter tudo no mesmo html.
### -A página funcionava, mas ainda faltava-me implementar clicks, por exemplo, quando alguém der click em "about me" a página mostrasse essas informações.
### -Pesquisei e apreendi que para isso era necessário dar-lhe um id específico a cada header, ou seja: 
	<h2 id='...'></h2>, 
### com um nome qualquer, para depois poder injetar um script listener que mostra o texto obtido do backend após um click do nosso mouse. O *getElementById* vai buscar o tipo especificado, neste casso o mesmo do header, e o *addEventListener('click')* espera o click do mouse para obter a informação que queremos.
### -Para a informação ser mostrada, foi necessário criar um separador vazio com uma id especifica debaixo de cada header:
 	<div id="..."></div>

### pois é ali onde o texto fornecido pelo backend é introduzido.