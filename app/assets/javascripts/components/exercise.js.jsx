var Exercise = React.createClass({
  getDefaultProps: function() {
    return {
      iconClasses: ['icon-code','icon-circle-slash','icon-check','icon-pencil','icon-x']
    };
  },

  getExerciseLink: function() {
    return (
      <a href={'/exercises/' + this.props.exercise.id}>Exercise {this.props.index + 1}</a>
    );
  },

  getExerciseIcons: function() {
    var iconClasses = this.props.iconClasses;
    var iconPath = this.props.iconPath;
    var svgStrings = iconClasses.map(function(iconClass){
      return '<svg class="' + iconClass + '"><use xlink:href="' + iconPath + '#' + iconClass + '"></use></svg>'
    });
    var html = svgStrings.join('');
    return {__html: html};
  },

  render: function() {
    return (
      <li>
        {this.getExerciseLink()}
        <div className="svg-icons" dangerouslySetInnerHTML={this.getExerciseIcons()} />
      </li>
    );
  }
});
