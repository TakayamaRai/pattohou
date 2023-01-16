class LayoutSetting {
  final bool hasCover;
  final bool isVertical;
  final bool isSets;
  final String itemCount;
  final String layoutType;

  const LayoutSetting({
    required this.hasCover,
    required this.isVertical,
    required this.isSets,
    required this.itemCount,
    required this.layoutType,
  });

  LayoutSetting copyWith(
      {bool? hasCover,
      bool? isVertical,
      bool? isSets,
      String? itemCount,
      String? layoutType}) {
    return LayoutSetting(
      hasCover: hasCover ?? this.hasCover,
      isVertical: isVertical ?? this.isVertical,
      isSets: isSets ?? this.isSets,
      itemCount: itemCount ?? this.itemCount,
      layoutType: layoutType ?? this.layoutType,
    );
  }
}
