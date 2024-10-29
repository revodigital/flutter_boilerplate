int effectiveNameCompareTo(a, b) {
  final regex = RegExp(r'(\D*)(\d*)');

  final matchA = regex.firstMatch(a.name?.toUpperCase() ?? a.id.toString());
  final matchB = regex.firstMatch(b.name?.toUpperCase() ?? b.id.toString());

  int comparison = matchA!.group(1)!.compareTo(matchB!.group(1)!);

  if (comparison == 0) {
    final numA = matchA.group(2)!.isEmpty ? 0 : int.parse(matchA.group(2)!);
    final numB = matchB.group(2)!.isEmpty ? 0 : int.parse(matchB.group(2)!);
    return numA.compareTo(numB);
  } else {
    return comparison;
  }
}

int effectiveNameInviteCompareTo(a, b) {
  final regex = RegExp(r'(\D*)(\d*)');

  final matchA = regex.firstMatch(a.harbor.name?.toUpperCase() ?? a.id.toString());
  final matchB = regex.firstMatch(b.harbor.name?.toUpperCase() ?? b.id.toString());

  int comparison = matchA!.group(1)!.compareTo(matchB!.group(1)!);

  if (comparison == 0) {
    final numA = matchA.group(2)!.isEmpty ? 0 : int.parse(matchA.group(2)!);
    final numB = matchB.group(2)!.isEmpty ? 0 : int.parse(matchB.group(2)!);
    return numA.compareTo(numB);
  } else {
    return comparison;
  }
}

int effectiveUtilityNumberCompareTo(a, b) {
  final regex = RegExp(r'(\D*)(\d*)');

  final matchA = regex.firstMatch(a.number.toString());
  final matchB = regex.firstMatch(b.number.toString());

  int comparison = matchA!.group(1)!.compareTo(matchB!.group(1)!);

  if (comparison == 0) {
    final numA = matchA.group(2)!.isEmpty ? 0 : int.parse(matchA.group(2)!);
    final numB = matchB.group(2)!.isEmpty ? 0 : int.parse(matchB.group(2)!);
    return numA.compareTo(numB);
  } else {
    return comparison;
  }
}