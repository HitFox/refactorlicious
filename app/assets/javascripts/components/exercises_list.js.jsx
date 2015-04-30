var ExercisesList = React.createClass({

  render: function() {
    var exercises = this.props.exercises.map(function(exercise, index){
          return <Exercise exercise={exercise} index={index + 1}/>
        })

    return (
      <div className="exercises-list">
        <ul>
          {exercises}
        </ul>
      </div>
    );
  }
});
