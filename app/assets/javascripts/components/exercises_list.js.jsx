var ExerciseList = React.createClass({
  render: function() {
    var iconsPath = this.props.iconsPath
    var exercises = this.props.exercises.map(function(exercise, index){
          return <Exercise exercise={exercise} index={index} iconsPath={iconsPath} />
        })

    return (
      <div className="exercise-list">
        <ul>
          {exercises}
        </ul>
      </div>
    );
  }
});
