var ExercisesPanel = React.createClass({

  render: function() {
    return (
      <div className="exercises-panel">
        <Sidebar filterItems={this.props.filterItems} />
        <ExerciseList exercises={this.props.exercises} iconsPath={this.props.iconsPath} />
      </div>
    );
  }
});
