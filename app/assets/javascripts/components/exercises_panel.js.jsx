var ExercisesPanel = React.createClass({

  render: function() {
    var exerciseCategoryNames = this.props.exerciseCategories.map(function(exerciseCategory){
      return exerciseCategory.name;
    })

    return (
      <div className="exercises-panel">
        <Sidebar exerciseCategoryNames={exerciseCategoryNames} />
        <ExercisesList exerciseCategories={this.props.exerciseCategories}/>
      </div>
    );
  }
});
