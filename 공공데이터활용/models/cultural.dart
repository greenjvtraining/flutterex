class Cultural{
  //final String DOJIJUNG_NO;
  final String MYONGCHING;
  final String CONTENT;

  Cultural({
    //required this.DOJIJUNG_NO,
    required this.MYONGCHING,
    required this.CONTENT
  });

  Cultural.fromJson(Map<String, dynamic> json)
    : //DOJIJUNG_NO = json['DOJIJUNG_NO'],
      MYONGCHING = json['MYONGCHING'],
      CONTENT = json['CONTENT'];

  Map<String, dynamic> toJson() => {
    //'DOJIJUNG_NO' : DOJIJUNG_NO,
    'MYONGCHING' : MYONGCHING,
    'CONTENT' : CONTENT
  };
}