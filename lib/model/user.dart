class UserDetails {
  String? name;
  String? height;
  String? weight;
  String? dob;
  String? bloodgroup;
  String? gender;
  List? ailments;
  List? myopia;
  List? chd;
  List? cb;
  List? pcod;

  String? get getName => this.name;

  set setName(String? name) => this.name = name;

  get getHeight => this.height;

  set setHeight(height) => this.height = height;

  get getWeight => this.weight;

  set setWeight(weight) => this.weight = weight;

  get getDob => this.dob;

  set setDob(dob) => this.dob = dob;

  get getBloodgroup => this.bloodgroup;

  set setBloodgroup(bloodgroup) => this.bloodgroup = bloodgroup;

  get getGender => this.gender;

  set setGender(gender) => this.gender = gender;

  get getAilments => this.ailments;

  set setAilments(ailments) => this.ailments = ailments;

  get getMyopia => this.myopia;

  set setMyopia(myopia) => this.myopia = myopia;

  get getCb => this.cb;

  set setCb(cb) => this.cb = cb;

  get getChd => this.chd;

  set setChd(chd) => this.chd = chd;

  get getPcod => this.pcod;

  set setPcod(pcod) => this.pcod = pcod;
}
