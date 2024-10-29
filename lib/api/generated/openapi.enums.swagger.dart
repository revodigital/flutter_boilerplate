import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

enum ElixirDifficulty {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Unknown')
  unknown('Unknown'),
  @JsonValue('Advanced')
  advanced('Advanced'),
  @JsonValue('Moderate')
  moderate('Moderate'),
  @JsonValue('Beginner')
  beginner('Beginner'),
  @JsonValue('OrdinaryWizardingLevel')
  ordinarywizardinglevel('OrdinaryWizardingLevel'),
  @JsonValue('OneOfAKind')
  oneofakind('OneOfAKind');

  final String? value;

  const ElixirDifficulty(this.value);
}

enum FeedbackType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('General')
  general('General'),
  @JsonValue('Bug')
  bug('Bug'),
  @JsonValue('DataError')
  dataerror('DataError'),
  @JsonValue('Suggestion')
  suggestion('Suggestion');

  final String? value;

  const FeedbackType(this.value);
}

enum SpellLight {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('None')
  none('None'),
  @JsonValue('Blue')
  blue('Blue'),
  @JsonValue('IcyBlue')
  icyblue('IcyBlue'),
  @JsonValue('Red')
  red('Red'),
  @JsonValue('Gold')
  gold('Gold'),
  @JsonValue('Purple')
  purple('Purple'),
  @JsonValue('Transparent')
  transparent('Transparent'),
  @JsonValue('White')
  white('White'),
  @JsonValue('Green')
  green('Green'),
  @JsonValue('Orange')
  orange('Orange'),
  @JsonValue('Yellow')
  yellow('Yellow'),
  @JsonValue('BrightBlue')
  brightblue('BrightBlue'),
  @JsonValue('Pink')
  pink('Pink'),
  @JsonValue('Violet')
  violet('Violet'),
  @JsonValue('BlueishWhite')
  blueishwhite('BlueishWhite'),
  @JsonValue('Silver')
  silver('Silver'),
  @JsonValue('Scarlet')
  scarlet('Scarlet'),
  @JsonValue('Fire')
  fire('Fire'),
  @JsonValue('FieryScarlet')
  fieryscarlet('FieryScarlet'),
  @JsonValue('Grey')
  grey('Grey'),
  @JsonValue('DarkRed')
  darkred('DarkRed'),
  @JsonValue('Turquoise')
  turquoise('Turquoise'),
  @JsonValue('PsychedelicTransparentWave')
  psychedelictransparentwave('PsychedelicTransparentWave'),
  @JsonValue('BrightYellow')
  brightyellow('BrightYellow'),
  @JsonValue('BlackSmoke')
  blacksmoke('BlackSmoke');

  final String? value;

  const SpellLight(this.value);
}

enum SpellType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('None')
  none('None'),
  @JsonValue('Charm')
  charm('Charm'),
  @JsonValue('Conjuration')
  conjuration('Conjuration'),
  @JsonValue('Spell')
  spell('Spell'),
  @JsonValue('Transfiguration')
  transfiguration('Transfiguration'),
  @JsonValue('HealingSpell')
  healingspell('HealingSpell'),
  @JsonValue('DarkCharm')
  darkcharm('DarkCharm'),
  @JsonValue('Jinx')
  jinx('Jinx'),
  @JsonValue('Curse')
  curse('Curse'),
  @JsonValue('MagicalTransportation')
  magicaltransportation('MagicalTransportation'),
  @JsonValue('Hex')
  hex('Hex'),
  @JsonValue('CounterSpell')
  counterspell('CounterSpell'),
  @JsonValue('DarkArts')
  darkarts('DarkArts'),
  @JsonValue('CounterJinx')
  counterjinx('CounterJinx'),
  @JsonValue('CounterCharm')
  countercharm('CounterCharm'),
  @JsonValue('Untransfiguration')
  untransfiguration('Untransfiguration'),
  @JsonValue('BindingMagicalContract')
  bindingmagicalcontract('BindingMagicalContract'),
  @JsonValue('Vanishment')
  vanishment('Vanishment');

  final String? value;

  const SpellType(this.value);
}

enum TraitName {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('None')
  none('None'),
  @JsonValue('Courage')
  courage('Courage'),
  @JsonValue('Bravery')
  bravery('Bravery'),
  @JsonValue('Determination')
  determination('Determination'),
  @JsonValue('Daring')
  daring('Daring'),
  @JsonValue('Nerve')
  nerve('Nerve'),
  @JsonValue('Chivalary')
  chivalary('Chivalary'),
  @JsonValue('Hardworking')
  hardworking('Hardworking'),
  @JsonValue('Patience')
  patience('Patience'),
  @JsonValue('Fairness')
  fairness('Fairness'),
  @JsonValue('Just')
  just('Just'),
  @JsonValue('Loyalty')
  loyalty('Loyalty'),
  @JsonValue('Modesty')
  modesty('Modesty'),
  @JsonValue('Wit')
  wit('Wit'),
  @JsonValue('Learning')
  learning('Learning'),
  @JsonValue('Wisdom')
  wisdom('Wisdom'),
  @JsonValue('Acceptance')
  acceptance('Acceptance'),
  @JsonValue('Inteligence')
  inteligence('Inteligence'),
  @JsonValue('Creativity')
  creativity('Creativity'),
  @JsonValue('Resourcefulness')
  resourcefulness('Resourcefulness'),
  @JsonValue('Pride')
  pride('Pride'),
  @JsonValue('Cunning')
  cunning('Cunning'),
  @JsonValue('Ambition')
  ambition('Ambition'),
  @JsonValue('Selfpreservation')
  selfpreservation('Selfpreservation');

  final String? value;

  const TraitName(this.value);
}
