// stores ExpansionPanel state information
class DropDownListExpansible {
  DropDownListExpansible({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}
