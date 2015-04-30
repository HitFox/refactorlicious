var ExerciseList = React.createClass({
  render: function() {
    var iconPath = this.props.iconPath
    var exercises = this.props.exercises.map(function(exercise, index){
          return <Exercise exercise={exercise} index={index} iconPath={iconPath} />
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
