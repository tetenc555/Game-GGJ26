extends Node


var dialogs: Dictionary  = {
	"mesaTrabalhoVerao": PackedStringArray(["Essa é minha mesa de trabalho, no tempo livre gosto de jogar jogos de fazendinha"]),
	"camaVerao": PackedStringArray(["A cama já não parece tão vazia, quanto algum tempo atras"]),
	"janelaVerao": PackedStringArray(["O calor de Xique Xique – Bahia permanece castigante"]),
	"criadomudoVerao": PackedStringArray(["Há um quadro de Sophia e Natalia sorrindo muito felizes. (Sophia - “Saudade de quando os dias eram mais simples como esse"]),
	"arnarioVerao": PackedStringArray(["Há algumas roupas antigas de Sophia que não deveriam estar ali"]),
	
	
	#dialogo1
	"Narrador1": PackedStringArray([" Em um salão isolado do mundo urbano, nossa protagonista se encontra em um baile de máscaras, junto com sua amada (talvez, nem tão amada... Só o futuro e atitudes de nossa protagonista dirão o curso que sua história terá).","Este baile de máscaras é uma tradição da alta sociedade brasileira, o evento ocorre em uma cúpula isolada do mundo, no coração da floresta amazônica. Nossa protagonista e sua companheira parecem estar tendo uma conversa um tanto, quanto acalorada... "]),
	"Dialogo1": PackedStringArray(["Sophia - “QUAL O SEU PROBLEMA NATALIA???” ","Natalia - “MEU PROBLEMA?? MEU PROBLEMA??” ","Natalia - “Meu problema é você!” ","Natalia - “Você nunca está errada, não é? Sempre sou eu o problema, você não consegue enxergar meio metro além dessa sua visão presunçosa e deturpada.” ","Sophia - “Como assim?? Eu não fiz nada!” ","Natalia - “ESSE é o seu problema, você nunca faz nada, nunca se importa, nunca interage, nunca se preocupa e nunca é a culpada!” ","Natalia se afasta de Sophia deixando-a falando sozinha e ainda sem compreender onde errou"]),
	#skip indo pra casa (tela preta)
	"Narrador2": PackedStringArray(["Sophia chateada e com seus sentimentos a flor da pele decide deixar o baile e retornar para sua casa. Ao retornar, Natalia só manda uma curta mensagem que diz: “Não me espere, vou ficar na casa da minha mãe, preciso de um tempo para pensar sobre a gente.” "]),
	

"DialogoQuarto1": PackedStringArray([
	"Sophia chega ao quarto do casal, ainda confusa e com os sentimentos muito aflorados.",
"Sophia - “AAAAAAAAAAAAAH!!!!!!!”",
"Sophia - “Às vezes a Natalia é tão difícil... eu só estava no meu canto durante o baile, ela não consegue entender que eu não gosto de estar no meio de muitas pessoas, é desgastante.”",
"Sophia - “Mas é claro que isso é impossível para a miss simpatia, ela não consegue não estar no centro das atenções.”",
"Sophia se deita cansada na cama do casal, agora mais vazia que o normal.",
"Ela pensa sobre os acontecimentos, tentando entender tudo o que aconteceu, mas algo chama sua atenção, sua máscara do baile está brilhando.",
"Ao se aproximar e pegar a máscara em suas mãos um sentimento surge, é como se a máscara a chamasse...",
"Sophia aproxima a máscara de seu rosto e a encaixa.",
"Uma luz intensa toma conta de seus olhos, Sophia sente por um breve momento a sensação de estar voando e no instante seguinte se vê novamente em seu quarto, mas algo não parece certo."
]),

"DialogoQuartoVerao": PackedStringArray([
"Celular vibra: notificação “sincronização de horário completa: data 31/01/2025”",
"Sophia - “O que está acontecendo??”",
"Sophia - “Isso só pode estar errado, hoje é 31/01/2026”",
"Sophia olha ao redor e inicialmente tudo parece normal até que..."
,"Natalia - “Oii amor”",
"Natalia se aproxima de Sophia e lhe dá um beijo.",
"Sophia - “AMOR? Você acabou de brigar comigo e me abandonou sozinha aqui.”",
"Natalia - “Do que você está falando? Acho que você teve algum tipo de pesadelo.”",
"Natalia - “Eu saí para terminar de organizar nossa viagem para Salvador.”",
"Sophia em sua mente - “Viagem para Salvador? A gente fez essa viagem há um ano atrás, o que está acontecendo aqui?”",
"Natalia - “Bem, espero que já tenha começado a preparar sua mala, a viagem é daqui uma semana.”"
]),

#Volta ao presnete
"Narrador3": PackedStringArray([
"Depois de repassar por todo seu quarto, Sophia volta sua atenção para a máscara, seu brilho permanece e chama sua atenção.",
"Novamente Sophia coloca a máscara e o sentimento de estar voando retorna."]),

"Narrador4": PackedStringArray([
"Novamente Sophia se vê em seu quarto, mas agora definitivamente algo mudou."
,"Celular vibra: notificação “sincronização de horário completa: data 31/06/2025”"
,"Sophia - “Parece que o destino está brincando com algum tipo de ‘De Volta para o Futuro’ deturpado.”",
"Sophia - “Ah... Eu lembro exatamente o que aconteceu algumas horas atrás...”"
,"Celular vibra: notificação “Natalia: Não sei se vou voltar para casa hoje, preciso de um tempo meu.”"
,"Sophia parece um pouco abalada e incomodada com a notificação em seu celular.",
"O quarto parece mais frio, quase melancólico."
,"Sophia - “Tantos momentos para poder reviver, logo esse?? Tinha que ser esse??”",
"Sophia - “Lembro essa briga foi o início de tudo...”",
"Sophia - “Eu lembro de sentir que Natalia escondia mais, mas não quis prolongar a discussão.”"
]),

"SofaInverno": PackedStringArray(["Nesse sofá Sophia e Natalia já viveram vários momentos de aconchego e troca de carinhos. A memória se torna dolorosa."]),
"GeladeiraInverno": PackedStringArray(["Somente um post it com a letra de Natalia: “LAVE SUA LOUÇA.”"]),
"PiaInverno": PackedStringArray(["Há uma montanha de louça suja, provavelmente está ali já faz semanas."]),
"FogaoInverno": PackedStringArray(["Há panelas sobre o fogão e um cheiro podre exalando delas."]),
"TVInverno": PackedStringArray(["Está passando um reality aleatório."]),
"MascaraChamando": PackedStringArray(["A máscara chama por Sophia."]),

"NarradorBaileVazio": PackedStringArray([
"Sophia se encontra novamente no salão do baile de máscaras, mas desta vez completamente sozinha."
]),

"CelularBug": PackedStringArray([
"Celular vibra: notificação “sincronização de horário completa: data 99/-15/7777”"
]),

"DialogoBaileVazio": PackedStringArray([
"Sophia - “Será que eu sou o problema?”",
"Sophia - “Será que eu só machuco as pessoas que me amam?”",
"Sophia - “Não consigo ser sociável, muitas interações me sobrecarregam.”",
"Sophia - “Não escolhi ser assim, eu sou.”",
"Sophia - “Agora eu vejo, mas acho que é tarde demais para esse entendimento.”",
"Sophia - “Eu só não percebo que estou machucando as pessoas.”"
]),

"NarradorFinal1": PackedStringArray([
"Celular vibra: notificação “sincronização de horário completa: data 01/02/2026.”"
,"Sophia percebe que está de volta em casa e no momento certo."
]),

"DialogoFinalConversa": PackedStringArray([
"Sophia - “Sinceramente... Acho que a pergunta certa seria, quando eu estava.”",
"Sophia - “Gostaria de conversar... Se você quiser.”",
"Sophia - “Eu entendi que acabei te machucando várias vezes, sem perceber.”",
"Sophia - “Eu não gosto de muitas pessoas, me sinto sobrecarregada sensorialmente.”",
"Sophia - “Eu entendo tudo de forma literal.”",
"Sophia - “Eu me acomodei, e isso te machucou.”",
"Sophia - “Desculpa.”",
"Natalia - “Eu nunca soube... só achei que você não se importava.”",
"Natalia - “Eu também errei por não tentar te entender.”",
"Natalia - “Eu te amo e quero ser seu porto seguro.”"
]),

"Encerramento": PackedStringArray([
"Sophia - “Eu te amo infinitamente.”",
"Narrador – Máscaras são bonitas, mas não foram feitas para esconder o seu verdadeiro eu."
])
}

func start_dialog_from_object(object_name: String, world_position: Vector2):
	if DialogManager.is_dialog_active:
		return
	if not dialogs.has(object_name):
		return
	var lines = dialogs[object_name]
	DialogManager.start_dialog(world_position, lines)
