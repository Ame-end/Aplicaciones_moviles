import 'models.dart';

class ListQuestions {
  static List<SurveyCategory> getSurveyCategories() {
    return [
      SurveyCategory(
        name: 'Contaminación',
        imagePath: 'Assets/Images/contaminacion.jpg',
        questions: [
          Question(
            text:
                '¿Qué tanto consideras que se ha contaminado el ecosistema de tu comunidad en el último año?',
            category: 'Contaminación',
          ),
          Question(
            text:
                '¿Qué tanto consideras que se ha contaminado el ecosistema de tu comunidad en los últimos 5 años?',
            category: 'Contaminación',
          ),
          Question(
            text:
                '¿Qué tanto consideras que se ha contaminado el ecosistema de tu comunidad en los últimos 10 años?',
            category: 'Contaminación',
          ),
        ],
      ),
      SurveyCategory(
        name: 'Deforestación',
        imagePath: 'Assets/Images/deforestacion.jpg',
        questions: [
          Question(
            text:
                '¿Qué tanto consideras que se ha removido el bosque para implementar cultivos (maíz, agave), ganadería o construcción de casas en el último año?',
            category: 'Deforestación',
          ),
          Question(
            text: '¿Y en los últimos 5 años?',
            category: 'Deforestación',
          ),
          Question(
            text: '¿Y en los últimos 10 años?',
            category: 'Deforestación',
          ),
        ],
      ),
      SurveyCategory(
        name: 'Avistamientos',
        imagePath: 'Assets/Images/avistamientos.jpg',
        questions: [
          Question(
            text: '¿Has visto a la tarántula de terciopelo negro?',
            category: 'Avistamientos',
          ),
          Question(text: '¿Dónde la has visto?', category: 'Avistamientos'),
          Question(
            text: '¿Con qué frecuencia la has visto?',
            category: 'Avistamientos',
          ),
        ],
      ),
      SurveyCategory(
        name: 'Comportamiento',
        imagePath: 'Assets/Images/comportamiento.jpg',
        questions: [
          Question(
            text:
                '¿Qué haces cuando te la encuentras en el campo, monte o bosque?',
            category: 'Comportamiento',
          ),
          Question(
            text: '¿Te afecta encontrarla en tus cultivos?',
            category: 'Comportamiento',
          ),
        ],
      ),
      SurveyCategory(
        name: 'Conocimientos',
        imagePath: 'Assets/Images/conocimientos.jpg',
        questions: [
          Question(
            text: '¿Qué haces (tú o tu familia) si la encuentras en tu casa?',
            category: 'Conocimientos',
          ),
          Question(
            text: '¿Conoces algún nombre en tu lengua materna para esta araña?',
            category: 'Conocimientos',
          ),
        ],
      ),
      SurveyCategory(
        name: 'Percepción del peligro',
        imagePath: 'Assets/Images/peligro.png',
        questions: [
          Question(
            text: '¿Te dan miedo las tarántulas?',
            category: 'Percepción del peligro',
          ),
          Question(
            text: '¿Crees que son venenosas para humanos?',
            category: 'Percepción del peligro',
          ),
          Question(
            text: '¿Crees que son venenosas para mascotas o ganado?',
            category: 'Percepción del peligro',
          ),
          Question(
            text: '¿Te ha picado, mordido o lastimado una tarántula?',
            category: 'Percepción del peligro',
          ),
          Question(
            text: '¿Qué has hecho cuando te ha mordido o picado?',
            category: 'Percepción del peligro',
          ),
        ],
      ),
      SurveyCategory(
        name: 'Remedios',
        imagePath: 'Assets/Images/remedios.jpg',
        questions: [
          Question(
            text:
                '¿Sabes si las tarántulas tienen uso medicinal en la comunidad?',
            category: 'Remedios',
          ),
        ],
      ),
      SurveyCategory(
        name: 'Cultural',
        imagePath: 'Assets/Images/cultural.jpg',
        questions: [
          Question(
            text:
                '¿Sabes si hay alguna representación de la tarántula en alguna artesanía, canción, vestimenta o vestigio arqueológico en la comunidad?',
            category: 'Cultural',
          ),
        ],
      ),
      SurveyCategory(
        name: 'Conservación',
        imagePath: 'Assets/Images/conservacion.png',
        questions: [
          Question(
            text:
                '¿Conoces la existencia de proyectos acerca del cuidado y preservación de la tarántula?',
            category: 'Conservación',
          ),
          Question(
            text:
                '¿Crees que conservando a la tarántula puedes generar ingresos económicos?',
            category: 'Conservación',
          ),
          Question(
            text:
                '¿Estarías dispuesto a participar en algún proyecto de conservación de la tarántula, aunque NO haya remuneración económica o pago?',
            category: 'Conservación',
          ),
          Question(
            text:
                '¿Estarías dispuesto a participar en algún proyecto de conservación de la tarántula CON remuneración económica o pago?',
            category: 'Conservación',
          ),
          Question(
            text:
                '¿Consideras que el establecimiento de un proyecto de conservación de la tarántula ayudaría a la comunidad o empresa?',
            category: 'Conservación',
          ),
          Question(
            text:
                '¿Apoyarías un reglamento comunitario (acuerdo de asamblea) para el cuidado y conservación de la tarántula?',
            category: 'Conservación',
          ),
          Question(
            text: '¿Estarías dispuesto a conocer más sobre la tarántula?',
            category: 'Conservación',
          ),
        ],
      ),
      SurveyCategory(
        name: 'Comercio',
        imagePath: 'Assets/Images/comercio.png',
        questions: [
          Question(
            text:
                '¿Sabías que algunas tarántulas se pueden comprar legalmente?',
            category: 'Comercio',
          ),
          Question(
            text:
                '¿Sabías que hay personas que tienen tarántulas como mascotas?',
            category: 'Comercio',
          ),
          Question(
            text: '¿Has visto tarántulas en tiendas de mascotas?',
            category: 'Comercio',
          ),
          Question(
            text: '¿Dónde se ubica la tienda donde la has visto?',
            category: 'Comercio',
          ),
          Question(
            text: '¿Conoces de alguien que venda tarántulas en la comunidad?',
            category: 'Comercio',
          ),
          Question(
            text:
                '¿Sabes si alguien de tu comunidad extrae las tarántulas para venderlas en México u otros países?',
            category: 'Comercio',
          ),
          Question(
            text:
                '¿Sabes si algún extranjero extrae las tarántulas para venderlas en México u otros países?',
            category: 'Comercio',
          ),
        ],
      ),
    ];
  }
}
