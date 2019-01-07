# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

speakers = Speaker.create(
  [
    {
      name: 'Studio Mals',
      slug: 'studio-mals'
    },
    {
      name: 'Pedro Pombo',
      slug: 'pedro-pombo'
    },
    {
      name: 'Rafaela Ferro',
      slug: 'rafaela-ferro'
    }
  ]
)

speakers.first.person_infos << PersonInfo.create([{
      order: 1,
      category: 'title',
      content: 'Sobre o nosso estúdio'
    }, {
      order: 2,
      category: 'paragraph',
      content: 'O Studio Mals produz imagens e filmagens cativantes e de alta qualidade. O seu trabalho é quase sempre tangível - de preferência feito à mão. Com uma abordagem conceptual, resulta numa forte linguagem visual.'
    }, {
      order: 3,
      category: 'title',
      content: 'Sobre a nossa sessão'
    }, {
      order: 4,
      category: 'paragraph',
      content: 'Nós sabemos que uma simples apresentação de portfólio pode tornar-se bastante aborrecida. Preferimos mostrar o que se passa por trás de cada uma das nossas criações e discutir o nosso processo. Assim, torna-se mais fácil explicar como chegamos aos nossos produtos extremamente atraentes e chamativos!'
    }, {
      order: 5,
      category: 'spacer',
      content: nil
    }, {
      order: 6,
      category: 'title',
      content: 'About our studio'
    }, {
      order: 7,
      category: 'paragraph',
      content: 'Mals crafts high quality eye-catching images and film. Our work is often tangible -preferably handmade- and has a conceptual approach. Combined with a playful attitude, it results in a strong visual language.'
    }, {
      order: 8,
      category: 'title',
      content: 'About our talk'
    }, {
      order: 9,
      category: 'paragraph',
      content: 'We know a simple portfolio slideshow is very boring. We prefer to show loads of behind the scenes and talk about the making of process. This way we can really get to the bottom of our ridiculously sexy crafted eye candy!'
    }, {
      order: 10,
      category: 'link',
      content: '[Saber Mais](//studiomals.com)'
    }
  ]
)

speakers.second.person_infos << PersonInfo.create([{
      order: 1,
      category: 'paragraph',
      content: 'Pedro Pombo é Director da Fábrica Centro Ciência Viva de Aveiro, docente no Departamento de Física da Universidade de Aveiro e especialista em Holografia, Comunicação de Ciência e Ensino da Física. Desenvolve investigação em técnicas holográficas, holografia educacional, compreensão pública da ciência, STEAM na educação em ciência e ensino experimental da física. Desenvolve exposições, centros de ciência, espaços Maker, materiais educativos, cursos de formação. Foi coordenador de 3 projetos europeus, 9 exposições, 29 projetos nacionais e é autor de 1 capítulo de livro, 3 manuais escolares, mais de 50 publicações em revistas nacionais e internacionais e recebeu 9 prémios europeus.'
    }
  ]
)

speakers.third.person_infos << PersonInfo.create([{
      order: 1,
      category: 'title',
      content: 'Sobre mim',
    }, {
      order: 2,
      category: 'paragraph',
      content: 'Designer e frontend developer na Deemaze Software, uma agência de software a criar produtos para web e mobile.'
    }, {
      order: 3,
      category: 'link',
      content: '[rafaelaferro.com](//rafaelaferro.com)'
    }, {
      order: 4,
      category: 'title',
      content: 'Sobre a talk'
    }, {
      order: 5,
      category: 'paragraph',
      content: 'Como parar de ver acessibilidade como um requisito extra, e integrar um processo de design+desenvolvimento inclusivo nas equipas de software. Vamos analisar algumas pré-concepções ligadas a acessibilidade e conversar sobre o papel de cada um na criação de tecnologia inclusiva.'
    }
  ]
)
