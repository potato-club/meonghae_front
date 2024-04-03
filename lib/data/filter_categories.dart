Map<String, dynamic> categoryDetail = {
  '직접입력': [],
  '예방접종': [
    {'label': '혼합예방주사', 'value': 'DHPPL', 'type': '🐶'},
    {'label': '코로나바이러스성 장염', 'value': 'Coronavirus', 'type': '🐶'},
    {'label': '기관ㆍ기관지염 ', 'value': 'KennelCough', 'type': '🐶'},
    {'label': '혼합예방주사', 'value': 'CVRP', 'type': '😺'},
    {'label': '고양이 백혈병', 'value': 'FelineLeukemia', 'type': '😺'},
    {'label': '전염성 복막염', 'value': 'FIP', 'type': '😺'},
    {'label': '광견병', 'value': 'Rabies', 'type': '🐶😺'},
  ],
  '구충제': [
    {'label': '심장 사상충', 'value': 'HeartWorm', 'type': '🐶😺'},
    {'label': '내부 기생충', 'value': 'InternalParasitic', 'type': '🐶😺'},
    {'label': '외부 기생충', 'value': 'ExternalParasites', 'type': '🐶😺'},
  ],
  '건강검진': [
    {'label': '건강검진', 'value': 'HealthScreenings', 'type': '🐶😺'},
  ],
};

List<String> categoryKey = [
  '직접입력',
  '예방접종',
  '구충제',
  '건강검진',
];

String getCategoryLabel(String value) {
  for (String key in categoryKey) {
    for (var i = 0; i < categoryDetail[key].length; i++) {
      if (categoryDetail[key][i]['value'] == value) {
        return categoryDetail[key][i]['label'];
      }
    }
  }
  return '';
}
