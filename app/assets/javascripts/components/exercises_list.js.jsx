var ExerciseList = React.createClass({

  showExercise: function(exercise) {
    var selected_category = this.props.selected_category;
    var selected_status = this.props.selected_status;
    var exercise_category = exercise.category;
    if (selected_category === "All" && selected_status === "All") return true;
    var hasCategory = selected_category === "All" || selected_category === exercise_category;
    var hasStatus = selected_status ==="All" || selected_status.toLowerCase() == exercise.status;
    return hasCategory&&hasStatus;
  },

  render: function() {
    var iconsPath = this.props.iconsPath;
    var showExercise = this.showExercise
    var exercises = this.props.exercises.map(function(exercise, index){
      if(showExercise(exercise)) {
        return <Exercise exercise={exercise} index={index} iconsPath={iconsPath} />
      }
    });

    return (
      <div className="exercise-list">
        <ul>
          {exercises}
        </ul>
      </div>
    );
  }
});
