var SvgIcon = React.createClass({
  getIconHtml: function() {
    var iconClass = this.props.iconClass;
    var iconsPath = this.props.iconsPath
    return '<svg class="' + iconClass + '"><use xlink:href="' + iconsPath + '#' + iconClass + '"></use></svg>'
  },

  render: function() {
    return (
      <span onClick={this.props.callback} dangerouslySetInnerHTML={{__html: this.getIconHtml()}}></span>
    );
  }
});
