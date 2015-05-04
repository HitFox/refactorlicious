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
    var iconsPath = this.props.iconsPath
    return this.props.iconClasses.map(function(iconClass) {
      return <SvgIcon iconClass={iconClass} iconsPath={iconsPath} />;
    });
  },

  render: function() {
    return (
      <li>
        {this.getExerciseLink()}
        <div className="svg-icons">{this.getExerciseIcons()}</div>
      </li>
    );
  }
});
