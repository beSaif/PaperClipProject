class OverviewModel {
  final int? id;
  final double? mcap, ev, bookValuePerShare, ttmpe, yieldValue;
  final String? security, sector, industry;

  OverviewModel(
      {this.id,
      this.security,
      this.sector,
      this.industry,
      this.mcap,
      this.ev,
      this.bookValuePerShare,
      this.ttmpe,
      this.yieldValue});
}
