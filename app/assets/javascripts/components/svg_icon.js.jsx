var SvgIcon = React.createClass({
  getIconHtml: function() {
    var iconClass = this.props.iconClass;
    var iconsPath = this.props.iconsPath;
    var iconLink = this.props.link || '#';
    return '<a href="' + iconLink + '"><svg class="' + iconClass + '"><use xlink:href="' + iconsPath + '#' + iconClass + '"></use></svg></a>'
  },

  render: function() {
    return (
      <span className={this.props.iconClass} onClick={this.props.callback} dangerouslySetInnerHTML={{__html: this.getIconHtml()}}></span>
    );
  }
});
