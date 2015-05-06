var Exercise = React.createClass({
  getInitialState: function() {
    return { deleted: false, 
              status: this.props.exercise.status }
  },

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

  deleteExercise: function() {
    if (confirm('Are you sure you want to delete this exercise for ever from the database?')) {
      $.ajax({
        url: '/admin/exercises/' + this.props.exercise.id,
        method: 'DELETE',
        success: function() {
          this.setState({deleted: !this.state.deleted});
        }.bind(this),
        error: function () {
          console.log('Error: Something went wrong on the server!', arguments);
        }.bind(this)
      });
    }
  },

  approveExercise: function() {
    this.props.exercise.status = 'approved';
    $.ajax({
      url: '/admin/exercises/' + this.props.exercise.id,
      method: 'PATCH',
      data: {exercise: this.props.exercise},
      success: function() {
        this.setState({status: this.props.exercise.status});
      }.bind(this),
      error: function () {
        console.log('Error: Something went wrong on the server!', arguments);
      }.bind(this)
    });
  },

  rejectExercise: function() {
    this.props.exercise.status = 'rejected';
    $.ajax({
      url: '/admin/exercises/' + this.props.exercise.id,
      method: 'PATCH',
      data: {exercise: this.props.exercise},
      success: function() {
        this.setState({status: this.props.exercise.status});
      }.bind(this),
      error: function () {
        console.log('Error: Something went wrong on the server!', arguments);
      }.bind(this)
    });
  },

  getExerciseIcons: function() {
    var iconsPath = this.props.iconsPath;
    var exerciseEditPath = '/admin/exercises/' + this.props.exercise.id + '/edit';
    var deleteExercise = this.deleteExercise;
    var approveExercise = this.approveExercise;
    var rejectExercise = this.rejectExercise;

    return this.props.iconClasses.map(function(iconClass) {
      if (iconClass === 'icon-pencil') {
        return (
          <SvgIcon iconClass={iconClass} iconsPath={iconsPath} link={exerciseEditPath} />
        );
      } else if (iconClass === 'icon-x') {
        return (
          <SvgIcon iconClass={iconClass} iconsPath={iconsPath} callback={deleteExercise} />
        );
      } else if (iconClass === 'icon-check') {
        return (
          <SvgIcon iconClass={iconClass} iconsPath={iconsPath} callback={approveExercise} />
        );
      } else if (iconClass === 'icon-circle-slash') {
        return (
          <SvgIcon iconClass={iconClass} iconsPath={iconsPath} callback={rejectExercise} />
        );
      } else {
        return <SvgIcon iconClass={iconClass} iconsPath={iconsPath} />;
      }
    });
  },

  render: function() {
    if (this.state.deleted === false) {
      return (
        <li className={this.state.status}>
          {this.getExerciseLink()}
          <div className="svg-icons">{this.getExerciseIcons()}</div>
        </li>
      );
    } else {
      return <div />;
    }
  }
});
