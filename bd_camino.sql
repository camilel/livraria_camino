create database bd_camino;

use bd_camino;

create table cliente (
	id integer primary key auto_increment,
    nome varchar(100) not null,
    cpf bigint not null,
    email varchar(100) not null,
    senha varchar(10) not null,
    endereco varchar(100) not null,
    telefone bigint not null,
    cidade varchar (50) not null,
    estado varchar (50) not null,
    cep integer not null
);

create table genero (
	id integer primary key auto_increment,
	nome varchar(50) not null
);

create table formato(
	id integer primary key auto_increment,
    tipo varchar(50) not null
);

create table autor(
	id integer primary key auto_increment,
    nome varchar(100) not null
);

create table tipo_publico(
	id integer primary key auto_increment,
    nome varchar(50) not null
);

create table livro (
	id integer primary key auto_increment,
    titulo varchar(100) not null,
    valor numeric(10,2) not null,
    imagem varchar(50) not null,
    id_autor integer not null,
    id_tipo_publico integer not null,
    id_genero integer not null,
    id_formato integer not null,
    descricao text,
    
    foreign key (id_autor) references autor(id),
    foreign key (id_tipo_publico) references tipo_publico(id),
    foreign key (id_genero) references genero(id),
    foreign key (id_formato) references formato(id)
);

create table mais_vendidos (
	id integer primary key auto_increment,
    id_livro integer not null,
    
    foreign key (id_livro) references livro(id)
);

create table carrinho(
	id integer primary key auto_increment,
    quantidade integer not null,
    id_livro integer not null,
    id_cliente integer not null,
    
    foreign key (id_livro) references livro(id),
    foreign key (id_cliente) references cliente(id)
);

create table pedido(
	id integer primary key auto_increment,
    total numeric(10,2) not null,
    id_carrinho integer not null,
    
    foreign key (id_carrinho) references carrinho(id)
);

INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Colleen Hoover');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Rebecca Yarros');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Prof. Renato Pereira');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Prof. Lucas Almeida');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Prof. Ana Lemos');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Editora');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Prof. Marcos Vieira');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Jane Smith');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Taylor Jenkins Reid');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Ana Silva');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Lucas Almeida');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Marina Estrela');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Clara Luz');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Anna King');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Emily Hart');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Emily Parker');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Dygo Kurokawa');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('George Morikawa');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Shuichi Shigeno');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Kanehito Yamada');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Sui Ichida');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Yusei Matsui');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Rumiko Takahaishi');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Muneyuki Kaneshiro');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Alex Michaelides');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Freida McFadden');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Riley Sager');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Victor Guerra');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Sofia Almeida');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Renata Vieira');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('André Farias');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Mariana Vidal');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Edwardo Torre');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Hugo Mendes');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Nicholas Sparks');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('John Doe');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Dustin Cartwright');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Alex Comics');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Mike Mignola');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Marjorie Liu');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Sarah J. Maas');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Michael Ende');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Leigh Bardugo');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('George R. Martin');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Liane Moriarty');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Josh Malerman');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('C.J. Tudor');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Stephen King');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Jorge Amado');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Jane Austen');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Emily Bronte');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Karen M. McManus');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Franz Kafka');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Markus Zusak');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Rachael Lippincott');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Cecelia Ahern');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('David Nicholls');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Jojo Moyes');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Fábio Moon e Gabriel Bá');
INSERT INTO `bd_camino`.`autor` (`nome`) VALUES ('Alison Bechdel');


INSERT INTO `bd_camino`.`formato` (`tipo`) VALUES ('História em Quadrinhos');
INSERT INTO `bd_camino`.`formato` (`tipo`) VALUES ('Livro');
INSERT INTO `bd_camino`.`formato` (`tipo`) VALUES ('Mangá');

INSERT INTO `bd_camino`.`genero` (`nome`) VALUES ('Drama');
INSERT INTO `bd_camino`.`genero` (`nome`) VALUES ('Fantasia');
INSERT INTO `bd_camino`.`genero` (`nome`) VALUES ('Romance');
INSERT INTO `bd_camino`.`genero` (`nome`) VALUES ('Suspense');
INSERT INTO `bd_camino`.`genero` (`nome`) VALUES ('Terror');
INSERT INTO `bd_camino`.`genero` (`nome`) VALUES ('Outros');


INSERT INTO `bd_camino`.`tipo_publico` (`nome`) VALUES ('Infantil');
INSERT INTO `bd_camino`.`tipo_publico` (`nome`) VALUES ('Jovens');
INSERT INTO `bd_camino`.`tipo_publico` (`nome`) VALUES ('Adultos');
INSERT INTO `bd_camino`.`tipo_publico` (`nome`) VALUES ('Didáticos');
INSERT INTO `bd_camino`.`tipo_publico` (`nome`) VALUES ('Geek');

INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`, `descricao`) VALUES ('Verity', '34.99', 'imagens/suspense3.jpg', '1', '3', '4', '2', 'Verity, de Colleen Hoover, é um thriller psicológico intenso sobre uma escritora que descobre segredos perturbadores enquanto tenta terminar o livro de uma autora famosa em coma. Mistério, suspense e reviravoltas inesperadas marcam essa trama envolvente.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Filosofia 2 Ano', '59.99', 'imagens/didatico1.jpg', '3', '4', '6', '2', 'Um convite à reflexão sobre o mundo, o pensamento e o ser humano. Este livro estimula o aluno a questionar, argumentar e compreender as ideias que moldam nossa forma de viver em sociedade.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Sociologia 2 Ano', '59.99', 'imagens/didatico2.jpg', '4', '4', '6', '2', 'Explora temas como cultura, desigualdade, identidade e cidadania, incentivando o olhar crítico sobre a realidade e a compreensão das estruturas sociais que nos cercam.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Matemática 6 Ano', '59.99', 'imagens/didatico3.jpg', '5', '4', '6', '2', 'Apresenta os fundamentos da matemática de forma clara e prática, com atividades e exemplos que conectam o conteúdo ao cotidiano do estudante.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Ciências 6 ', '59.99', 'imagens/didatico4.jpg', '6', '4', '6', '2', 'Desperta a curiosidade científica com experimentos, ilustrações e explicações acessíveis sobre o corpo humano, o meio ambiente e os fenômenos da natureza.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Matemática 7', '59.99', 'imagens/didatico5.jpg', '6', '4', '6', '2', 'Aprofunda conceitos e estimula o raciocínio lógico por meio de desafios e situações-problema que tornam o aprendizado mais dinâmico.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('História 6 Ano', '59.99', 'imagens/didatico6.jpg', '6', '4', '6', '2', 'Apresenta de forma envolvente as civilizações antigas, suas culturas e transformações, ajudando o aluno a compreender a construção da sociedade atual.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Geografia 9 Ano', '59.99', 'imagens/didatico7.jpg', '6', '4', '6', '2', 'Explora os principais aspectos físicos e humanos do mundo contemporâneo, relacionando território, economia e meio ambiente.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Biologia Ensino Médio', '59.99', 'imagens/didatico8.jpg', '7', '4', '6', '2', 'Investiga a vida em suas diversas formas, da célula aos ecossistemas, com linguagem clara e atividades que conectam ciência e cotidiano.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('The Math Workbook', '59.99', 'imagens/didatico9.jpg', '8', '4', '6', '2', 'Um material prático e completo, com exercícios progressivos, explicações simples e desafios ideais para desenvolver habilidades matemáticas com confiança.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Os Sete Maridos de Evelyn Hugo', '34.99', 'imagens/drama1.jpg', '9', '3', '1', '2', 'A glamourosa e misteriosa Evelyn revela sua história repleta de amores, segredos e sacrifícios — um retrato poderoso sobre fama, identidade e escolhas.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('It Ends With Us', '34.99', 'imagens/drama2.jpg', '1', '3', '1', '2', 'Uma narrativa intensa sobre amor, dor e superação, em que Lily aprende que às vezes é preciso coragem para romper ciclos e recomeçar.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Quarta Asa', '44.99', 'imagens/fantasia1.jpg', '2', '3', '2', '2', 'Entre batalhas e dragões, Violet enfrenta a academia de guerra onde apenas os mais fortes sobrevivem — e descobre seu próprio poder.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Chama de Ferro', '44.99', 'imagens/fantasia2.jpg', '2', '3', '2', '2', 'O fogo da magia e o peso da liderança se cruzam quando um império entra em colapso e heróis improváveis precisam renascer das cinzas.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Tempestade de Ônix', '44.99', 'imagens/fantasia3.jpg', '2', '3', '2', '2', 'Sombras, magia e intrigas se misturam em um mundo onde a força interior é a única arma contra o destino.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('O Dino Grande', '7.99', 'imagens/infantil1.jpg', '10', '1', '6', '2', 'Dino é um dinossauro enorme, mas com um coração ainda maior. Mesmo sendo diferente dos outros, ele mostra que a verdadeira força vem da bondade e da amizade. Uma história divertida sobre coragem, aceitação e amor próprio.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('A Aventura na Floresta', '7.99', 'imagens/infantil2.jpg', '11', '1', '6', '2', 'Quando o pequeno raposo decide explorar a floresta, ele descobre muito mais do que esperava: novos amigos, desafios e lições sobre confiança e curiosidade. Uma jornada cheia de cores, risadas e descobertas mágicas.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('O Guarda-Chuvinha que Queria Voar', '7.99', 'imagens/infantil3.jpg', '12', '1', '6', '2', 'Guarda-Chuvinha sempre sonhou em voar como os balões coloridos do céu. Um dia, o vento soprou forte e o convidou para uma grande aventura. Uma história encantadora sobre sonhos, coragem e acreditar em si mesmo.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('O Relógio que Parou o Tempo', '7.99', 'imagens/infantil4.jpg', '13', '1', '6', '2', 'De repente, o relógio da cidade parou, e o tempo ficou quietinho. Nesse silêncio, uma menina aprende a ver a beleza nas pequenas coisas — o canto dos pássaros, o cheiro das flores, o calor do sol. Uma história poética sobre pausa, calma e presença.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('A Lâmpada que Brilhava por Dentro', '7.99', 'imagens/infantil5.jpg', '12', '1', '6', '2', 'No fundo de uma prateleira escura, uma pequena lâmpada se sentia apagada e sem valor. Até descobrir que sua luz vinha de dentro, e que brilhar é algo que todos podem aprender. Um conto cheio de ternura sobre autoestima e descoberta.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Toby\'s Toy Box', '7.99', 'imagens/infantil6.jpg', '14', '1', '6', '2', 'Toby adora brincar, mas um dia sua caixa de brinquedos ganha vida e o leva a um mundo mágico. Lá, cada brinquedo tem uma história e uma lição para ensinar. Uma aventura divertida que fala sobre imaginação, amizade e partilha.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('The Friendly Dragon', '7.99', 'imagens/infantil7.jpg', '15', '1', '6', '2', 'Num reino distante, uma menina conhece um dragão que, ao contrário do que todos pensam, é gentil e medroso. Juntos, eles mostram que ser diferente é o que torna cada um especial. Uma história doce sobre empatia e aceitação.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('The Little Pirate', '7.99', 'imagens/infantil8.jpg', '16', '1', '6', '2', 'O pequeno pirata adora aventuras e sonha em encontrar um grande tesouro. Com seu barco colorido e uma tripulação divertida, ele descobre que o verdadeiro tesouro está nas amizades e nas histórias que vive pelo caminho.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Inazuma Eleven', '29.99', 'imagens/manga1.jpg', '17', '2', '6', '3', 'Times de futebol e poderes especiais se unem em partidas cheias de energia, amizade e determinação.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('The Fighting! IPPO', '29.99', 'imagens/manga2.jpg', '18', '2', '6', '3', 'Um jovem boxeador descobre a força da persistência enquanto busca se superar dentro e fora do ringue.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Initial D', '29.99', 'imagens/manga3.jpg', '19', '2', '6', '3', 'Corridas noturnas nas montanhas do Japão e a paixão pela velocidade definem essa história de adrenalina e superação.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Souson no Frieren', '29.99', 'imagens/manga4.jpg', '20', '2', '6', '3', 'Após o fim de uma grande jornada, uma elfa imortal reflete sobre o valor das memórias e da passagem do tempo.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Tokyo Ghoul', '29.99', 'imagens/manga5.jpg', '21', '2', '6', '3', 'Entre humanos e ghouls, um jovem dividido entre dois mundos enfrenta o horror da própria transformação.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Assassination Classroom', '29.99', 'imagens/manga6.jpg', '22', '2', '6', '3', 'Alunos precisam eliminar seu professor alienígena antes que ele destrua a Terra — mas acabam aprendendo muito mais do que imaginam.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Inuyasha', '29.99', 'imagens/manga7.jpg', '23', '2', '6', '3', 'Entre tempos e mundos, uma jovem e um meio-demônio enfrentam forças sombrias em busca de redenção e amor.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Blue Lock', '29.99', 'imagens/manga8.jpg', '24', '2', '6', '3', 'Uma competição intensa transforma jogadores comuns em atacantes lendários, explorando a ambição e o ego no futebol.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Uma Segunda Chance', '34.99', 'imagens/romance1.jpg', '1', '3', '3', '2', 'Dois corações que se desencontraram no passado tentam reescrever o próprio destino e descobrir se o amor pode recomeçar.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Tudo que Deixamos Inacabado', '34.99', 'imagens/romance2.jpg', '2', '3', '3', '2', 'Entre lembranças e promessas quebradas, uma história sobre o poder do tempo e as segundas oportunidades.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('A Paciente Silenciosa', '34.99', 'imagens/suspense1.jpg', '25', '3', '4', '2', 'Uma mulher que parou de falar após um crime brutal. Um psicólogo determinado a descobrir a verdade.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('A Empregada', '34.99', 'imagens/suspense2.jpg', '26', '3', '4', '2', 'Nada é o que parece na casa perfeita onde uma nova funcionária guarda segredos e observa tudo.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('O Massacre da Família Hope', '34.99', 'imagens/suspense4.jpg', '27', '3', '4', '2', 'Um crime misterioso abala uma pequena cidade, e as respostas podem estar onde ninguém ousa procurar.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Entre o Sono e a Fome', '34.99', 'imagens/terror1.jpg', '28', '3', '5', '2', 'Uma vila esquecida mergulha em pesadelos quando o silêncio da noite ganha voz.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('As Coisas que Sussurram nas Paredes', '34.99', 'imagens/terror2.jpg', '29', '3', '5', '2', 'Ecos do passado atormentam uma casa onde o tempo parece distorcido — e o medo, constante.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Debaixo da Pele do Silêncio', '34.99', 'imagens/terror3.jpg', '30', '3', '5', '2', 'Algo se move onde não deveria existir vida. Um terror que se infiltra por dentro.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Quando o Vento Leva Nomes', '34.99', 'imagens/terror4.jpg', '31', '3', '5', '2', 'Cada rajada traz lembranças de quem já se foi… mas o vento também pode chamar de volta.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Flores Para os Esquecidos', '34.99', 'imagens/terror5.jpg', '32', '3', '5', '2', 'Um cemitério antigo guarda segredos que florescem toda noite, quando ninguém ousa visitar.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('A Casa Onde Dormem os Gritos', '34.99', 'imagens/terror6.jpg', '33', '3', '5', '2', 'Uma mansão isolada, histórias antigas e ecos que se recusam a morrer.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('A Última Luz da Vela', '34.99', 'imagens/terror7.png', '34', '3', '5', '2', 'Enquanto a chama vacila, algo se aproxima. Um conto sobre medo, fé e o fim da esperança.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('O Instituto', '34.99', 'imagens/terror8.jpg', '48', '3', '5', '2', 'Crianças com dons especiais são prisioneiras de uma organização sombria. Apenas uma pode escapar.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Capitães da Areia ', '34.99', 'imagens/drama3.jpg', '49', '3', '1', '2', 'Um retrato marcante da infância marginalizada nas ruas de Salvador, onde um grupo de meninos luta por liberdade e dignidade.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Orgulho e Preconceito', '34.99', 'imagens/drama4.jpg', '50', '3', '1', '2', 'O clássico que contrapõe razão e sentimento, mostrando o amadurecimento de Elizabeth Bennet diante das convenções sociais e do amor inesperado.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('O Morro dos Ventos Uivantes ', '34.99', 'imagens/drama5.jpg', '51', '3', '1', '2', 'Uma história de paixão e vingança que atravessa gerações, com personagens intensos e um cenário envolto em mistério e tragédia.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('O Diário de uma Paixão', '34.99', 'imagens/drama6.jpg', '35', '3', '1', '2', 'Um amor que resiste ao tempo e à memória, contado com ternura e emoção em cada página.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('A Metamorfose', '34.99', 'imagens/drama7.jpg', '53', '3', '1', '2', 'Um retrato simbólico sobre isolamento e identidade, onde um homem acorda transformado e precisa lidar com a indiferença do mundo.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('A Menina que Roubava Livros', '34.99', 'imagens/drama8.jpg', '54', '3', '1', '2', 'Durante a Segunda Guerra Mundial, uma menina encontra nos livros o poder de resistir à dor e preservar a humanidade.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Corte de Espinhos e Rosas', '34.99', 'imagens/fantasia4.jpg', '41', '3', '2', '2', 'Entre reinos feéricos e paixões proibidas, uma jovem descobre o limite entre o amor e o sacrifício.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('A história Sem Fim', '34.99', 'imagens/fantasia5.jpg', '42', '3', '2', '2', 'Uma jornada imaginária onde a leitura se torna mágica e o leitor faz parte da aventura.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Seis de Corvos', '34.99', 'imagens/fantasia6.jpg', '43', '3', '2', '2', 'Um grupo de foras da lei se une para realizar um assalto impossível — coragem, inteligência e lealdade testadas a cada página.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('As Cronicas de Gelo e Fogo', '34.99', 'imagens/fantasia7.jpg', '44', '3', '2', '2', 'Intrigas, batalhas e dragões moldam o destino de reinos em uma saga épica sobre poder e sobrevivência.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Trono de Vidro', '34.99', 'imagens/fantasia8.jpg', '41', '3', '2', '2', 'Uma assassina talentosa luta por liberdade em meio a conspirações, magia e segredos que podem mudar o reino.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Monstress', '28.99', 'imagens/hq1.jpg', '40', '5', '2', '1', 'Em um mundo dividido por guerra e magia, uma jovem luta contra monstros — e contra o que habita dentro dela.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('SpiderHound', '28.99', 'imagens/hq2.jpg', '38', '5', '2', '1', 'Um herói ágil e sarcástico enfrenta o crime urbano enquanto tenta equilibrar poder e responsabilidade.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Mighty Man', '28.99', 'imagens/hq3.jpg', '36', '5', '2', '1', 'Um símbolo de esperança que desafia tiranos e inspira coragem em todos os cantos do mundo.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Galactic Guardian', '28.99', 'imagens/hq4.jpg', '37', '5', '2', '1', 'Entre planetas e batalhas cósmicas, um guardião enfrenta forças que ameaçam o equilíbrio do universo.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Rainforce', '28.99', 'imagens/hq5.jpg', '38', '5', '2', '1', 'Um grupo de heróis climáticos luta contra desastres criados pela própria humanidade.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('HellBoy', '28.99', 'imagens/hq6.jpg', '39', '5', '2', '1', 'Metade demônio, metade herói, Hellboy enfrenta criaturas místicas e dilemas sobre o que significa ser humano.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Daytripper', '28.99', 'imagens/hq7.jpg', '59', '5', '2', '1', 'Cada capítulo é um fragmento da vida — e da morte — de um homem comum, em uma reflexão poética sobre existência.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Fun Home ', '28.99', 'imagens/hq8.jpg', '60', '5', '2', '1', 'Uma história autobiográfica que mistura memória, descoberta e identidade, contada com sensibilidade e humor.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('P.S. Eu Te Amo', '34.99', 'imagens/romance3.jpg', '56', '3', '3', '2', 'Após a perda do marido, Holly encontra cartas deixadas por ele, guiando-a para redescobrir a alegria de viver.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Um Dia', '34.99', 'imagens/romance4.jpg', '57', '3', '3', '2', 'Acompanhe um amor que atravessa anos e mudanças, mostrando como o tempo molda sentimentos e escolhas.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Como Eu Era Antes de Você', '34.99', 'imagens/romance5.jpg', '58', '3', '3', '2', 'Um encontro inesperado muda a vida de duas pessoas, revelando o poder transformador do amor e da empatia.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('A Cinco Passos de Você', '34.99', 'imagens/romance6.jpg', '55', '3', '3', '2', 'Mesmo separados pela doença, dois jovens encontram na distância a forma mais pura de amor.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Simplesmente Acontece', '34.99', 'imagens/romance7.jpg', '56', '3', '3', '2', 'Entre desencontros e destinos, Rosie e Alex provam que o amor verdadeiro pode esperar o tempo que for preciso.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Gabriela, Cravo e Canela', '34.99', 'imagens/romance8.jpg', '49', '3', '3', '2', 'Uma história vibrante sobre paixão, liberdade e o choque entre o moderno e o tradicional em Ilhéus.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Pequenas Grandes Mentiras', '34.99', 'imagens/suspense5.jpg', '45', '3', '4', '2', 'Três mulheres, uma escola e segredos que se cruzam até culminar em uma tragédia.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Caixa de Pássaros', '34.99', 'imagens/suspense6.jpg', '46', '3', '4', '2', 'Num mundo dominado pelo medo, basta um olhar para enlouquecer. Uma corrida pela sobrevivência às cegas.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('O Homem de Giz', '34.99', 'imagens/suspense7.jpg', '47', '3', '4', '2', 'Brincadeiras de infância se transformam em pesadelos quando figuras do passado voltam à tona.');
INSERT INTO `bd_camino`.`livro` (`titulo`, `valor`, `imagem`, `id_autor`, `id_tipo_publico`, `id_genero`, `id_formato`,`descricao`) VALUES ('Um de Nós Está Mentindo', '34.99', 'imagens/suspense8.jpg', '52', '3', '4', '2', 'Cinco estudantes entram em detenção, mas apenas quatro saem com vida. Todos têm algo a esconder.');

INSERT INTO `bd_camino`.`mais_vendidos` (`id_livro`) VALUES ('1');
INSERT INTO `bd_camino`.`mais_vendidos` (`id_livro`) VALUES ('11');
INSERT INTO `bd_camino`.`mais_vendidos` (`id_livro`) VALUES ('12');
INSERT INTO `bd_camino`.`mais_vendidos` (`id_livro`) VALUES ('13');
INSERT INTO `bd_camino`.`mais_vendidos` (`id_livro`) VALUES ('31');

INSERT INTO `bd_camino`.`cliente` (`nome`, `cpf`, `email`, `senha`, `endereco`, `telefone`, `cidade`, `estado`, `cep`) VALUES ('Teste', '51887872884', 'teste@email.com', '1234', 'Av. Teste 123', '16999999999', 'Americo', 'sp', '14000000');