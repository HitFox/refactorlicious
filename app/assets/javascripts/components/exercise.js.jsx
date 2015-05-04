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
    var iconsPath = this.props.iconsPath;
    var exerciseEditPath = '/admin/exercises/' + this.props.exercise.id + '/edit';

    return this.props.iconClasses.map(function(iconClass) {
      if (iconClass === 'icon-pencil') {
        return (
          <SvgIcon iconClass={iconClass} iconsPath={iconsPath} link={exerciseEditPath} />
        );
      } else {
        return <SvgIcon iconClass={iconClass} iconsPath={iconsPath} />;
      }
    });
  },

  render: function() {
    return (
      <li className={this.props.exercise.status}>
        {this.getExerciseLink()}
        <div className="svg-icons">{this.getExerciseIcons()}</div>
      </li>
    );
  }
});
