var ExercisesPanel = React.createClass({

  render: function() {
    return (
      <div className="exercises-panel">
        <Sidebar filterItems={this.props.filterItems} />
        <ExercisesList exercises={this.props.exercises} />
      </div>
    );
  }
});
