var ExercisesPanel = React.createClass({

  render: function() {
    return (
      <div className="exercises-panel">
        <Sidebar filterItems={this.props.filterItems} />
        <ExerciseList exercises={this.props.exercises} iconPath={this.props.iconPath} />
      </div>
    );
  }
});
