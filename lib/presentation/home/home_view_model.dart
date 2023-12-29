import 'package:flutter/foundation.dart';
import 'package:tabata_timer/common/constants.dart';
import 'package:tabata_timer/presentation/extension/int_convert_minute_seconds.dart';
import 'package:tabata_timer/presentation/home/list_item_view_model.dart';
import 'package:tabata_timer/presentation/model/tabata_element.dart';

final class HomeViewModel with ChangeNotifier {
  int _preparationSeconds = minimum;
  int _cycleCount = minimum;
  int _cycleBreakSeconds = minimum;
  int _roundCount = minimum;
  int _exerciseSeconds = minimum;
  int _breakSeconds = minimum;
  final List<List<TabataElement>> _listElementGroupedBySection = [
    [TabataElement.preparationSeconds],
    [TabataElement.roundCount, TabataElement.exerciseSeconds, TabataElement.breakSeconds],
    [TabataElement.cycleCount, TabataElement.cycleBreakSeconds],
  ];

  HomeViewModel() {
  }

  int get sectionCount => _listElementGroupedBySection.length;

  List<List<ListItemViewModel>> get listItemViewModels => _listElementGroupedBySection
      .map((section) => section.map((row) => ListItemViewModel(element: row)).toList())
      .toList();

  String get totalMinuteSeconds {
    final roundSeconds = _exerciseSeconds + _breakSeconds;
    final totalRoundSeconds = roundSeconds * _roundCount;
    final cycleSeconds = totalRoundSeconds + _cycleBreakSeconds;
    final totalCycleSeconds = cycleSeconds * _cycleCount;
    return (_preparationSeconds + totalCycleSeconds).convertMinuteSeconds();
  }

  int countOfRow({required int section}) =>
      section < sectionCount && section >= 0 ? _listElementGroupedBySection[section].length : 0;

  String getValue({required TabataElement element}) {
    switch (element) {
      case TabataElement.preparationSeconds:
        return _preparationSeconds.convertMinuteSeconds();
      case TabataElement.cycleCount:
        return '$_cycleCount';
      case TabataElement.cycleBreakSeconds:
        return _cycleBreakSeconds.convertMinuteSeconds();
      case TabataElement.roundCount:
        return '$_roundCount';
      case TabataElement.exerciseSeconds:
        return _exerciseSeconds.convertMinuteSeconds();
      case TabataElement.breakSeconds:
        return _breakSeconds.convertMinuteSeconds();
    }
  }

  void increase({required TabataElement element, int value = 1}) {
    switch (element) {
      case TabataElement.preparationSeconds:
        if (_preparationSeconds == 3599) return;
        _preparationSeconds += value;
        break;
      case TabataElement.cycleCount:
        if (_cycleCount == 99) return;
        _cycleCount += value;
        break;
      case TabataElement.cycleBreakSeconds:
        if (_cycleBreakSeconds == 3599) return;
        _cycleBreakSeconds += value;
        break;
      case TabataElement.roundCount:
        if (_roundCount == 99) return;
        _roundCount += value;
        break;
      case TabataElement.exerciseSeconds:
        if (_exerciseSeconds == 3599) return;
        _exerciseSeconds += value;
        break;
      case TabataElement.breakSeconds:
        if (_breakSeconds == 3599) return;
        _breakSeconds += value;
        break;
    }
    notifyListeners();
  }

  void decrease({required TabataElement element, int value = 1}) {
    switch (element) {
      case TabataElement.preparationSeconds:
        if (_preparationSeconds == 1) return;
        _preparationSeconds -= value;
        break;
      case TabataElement.cycleCount:
        if (_cycleCount == 1) return;
        _cycleCount -= value;
        break;
      case TabataElement.cycleBreakSeconds:
        if (_cycleBreakSeconds == 1) return;
        _cycleBreakSeconds -= value;
        break;
      case TabataElement.roundCount:
        if (_roundCount == 1) return;
        _roundCount -= value;
        break;
      case TabataElement.exerciseSeconds:
        if (_exerciseSeconds == 1) return;
        _exerciseSeconds -= value;
        break;
      case TabataElement.breakSeconds:
        if (_breakSeconds == 1) return;
        _breakSeconds -= value;
        break;
    }
    notifyListeners();
  }
}
