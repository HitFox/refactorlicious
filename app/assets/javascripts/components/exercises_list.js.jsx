var ExercisesList = React.createClass({

  render: function() {
    var exercises = this.props.exerciseCategories.map(function(exerciseCategory){
          return <Exercise exerciseCategory={exerciseCategory} />
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
