

//Domingos de Pascua hasta 2050
var domingoPascua2020 = new DateTime.utc(2020, DateTime.april, 12);
var domingoPascua2021 = new DateTime.utc(2021, DateTime.april, 4);
var domingoPascua2022 = new DateTime.utc(2022, DateTime.april, 17);
var domingoPascua2023 = new DateTime.utc(2023, DateTime.april, 9);
var domingoPascua2024 = new DateTime.utc(2024, DateTime.march, 31);
var domingoPascua2025 = new DateTime.utc(2025, DateTime.april, 20);
var domingoPascua2026 = new DateTime.utc(2026, DateTime.april, 5);
var domingoPascua2027 = new DateTime.utc(2027, DateTime.march, 28);
var domingoPascua2028 = new DateTime.utc(2028, DateTime.april, 16);
var domingoPascua2029 = new DateTime.utc(2029, DateTime.april, 1);
var domingoPascua2030 = new DateTime.utc(2030, DateTime.april, 21);
var domingoPascua2031 = new DateTime.utc(2031, DateTime.april, 13);
var domingoPascua2032 = new DateTime.utc(2032, DateTime.march, 28);
var domingoPascua2033 = new DateTime.utc(2033, DateTime.april, 17);
var domingoPascua2034 = new DateTime.utc(2034, DateTime.april, 9);
var domingoPascua2035 = new DateTime.utc(2035, DateTime.march, 25);
var domingoPascua2036 = new DateTime.utc(2036, DateTime.april, 13);
var domingoPascua2037 = new DateTime.utc(2037, DateTime.april, 5);
var domingoPascua2038 = new DateTime.utc(2038, DateTime.april, 25);
var domingoPascua2039 = new DateTime.utc(2039, DateTime.april, 10);
var domingoPascua2040 = new DateTime.utc(2040, DateTime.april, 1);
var domingoPascua2041 = new DateTime.utc(2041, DateTime.april, 21);
var domingoPascua2042 = new DateTime.utc(2042, DateTime.april, 6);
var domingoPascua2043 = new DateTime.utc(2043, DateTime.march, 29);
var domingoPascua2044 = new DateTime.utc(2044, DateTime.april, 17);
var domingoPascua2045 = new DateTime.utc(2045, DateTime.april, 9);
var domingoPascua2046 = new DateTime.utc(2046, DateTime.march, 25);
var domingoPascua2047 = new DateTime.utc(2047, DateTime.april, 14);
var domingoPascua2048 = new DateTime.utc(2048, DateTime.april, 5);
var domingoPascua2049 = new DateTime.utc(2049, DateTime.april, 18);
var domingoPascua2050 = new DateTime.utc(2050, DateTime.april, 10);


//Methods
//Returns current year
int currentYear = DateTime.now().year;


//return current Easter Sunday
DateTime currentEaster() {
  if (currentYear == 2020) {
    return domingoPascua2020;
  }
  if (currentYear == 2021) {
    return domingoPascua2021;
  }
  if (currentYear == 2022) {
    return domingoPascua2022;
  }
  if (currentYear == 2023) {
    return domingoPascua2023;
  }
  if (currentYear == 2024) {
    return domingoPascua2024;
  }
  if (currentYear == 2025) {
    return domingoPascua2025;
  }
  if (currentYear == 2026) {
    return domingoPascua2026;
  }
  if (currentYear == 2027) {
    return domingoPascua2027;
  }
  if (currentYear == 2028) {
    return domingoPascua2028;
  }
  if (currentYear == 2029) {
    return domingoPascua2029;
  }
  if (currentYear == 2030) {
    return domingoPascua2030;
  }
  if (currentYear == 2031) {
    return domingoPascua2031;
  }
  if (currentYear == 2032) {
    return domingoPascua2032;
  }
  if (currentYear == 2033) {
    return domingoPascua2033;
  }
  if (currentYear == 2034) {
    return domingoPascua2034;
  }
  if (currentYear == 2035) {
    return domingoPascua2035;
  }
  if (currentYear == 2036) {
    return domingoPascua2036;
  }
  if (currentYear == 2037) {
    return domingoPascua2037;
  }
  if (currentYear == 2038) {
    return domingoPascua2038;
  }
  if (currentYear == 2039) {
    return domingoPascua2039;
  }
  if (currentYear == 2040) {
    return domingoPascua2040;
  }
  if (currentYear == 2041) {
    return domingoPascua2041;
  }
  if (currentYear == 2042) {
    return domingoPascua2042;
  }
  if (currentYear == 2043) {
    return domingoPascua2043;
  }
  if (currentYear == 2044) {
    return domingoPascua2044;
  }
  if (currentYear == 2045) {
    return domingoPascua2045;
  }
  if (currentYear == 2046) {
    return domingoPascua2046;
  }
  if (currentYear == 2047) {
    return domingoPascua2047;
  }
  if (currentYear == 2048) {
    return domingoPascua2048;
  }
  if (currentYear == 2049) {
    return domingoPascua2049;
  }
  if (currentYear == 2050) {
    return domingoPascua2050;
  }
  return domingoPascua2050;
}

//Method to add year
int addYear (int year){
  if (year==2050){
    return 2050;
  }else {
    return year+1;
  }
}

//Method to subtract year
int subtractYear (int year){
  if (year==2020){
    return 2020;
  }else {
    return year-1;
  }
}

//Method to add day
int addDay31 (int day){
  if (day==31){
    return 1;
  }else {
    return day+1;
  }
}

//Method to subtract year
int subtractDay31 (int day){
  if (day==1){
    return 30;
  }else {
    return day-1;
  }
}
