var Exercise = React.createClass({
  propTypes: {
    points: React.PropTypes.number,
    codeToRefactor: React.PropTypes.string,
    solution: React.PropTypes.string,
    status: React.PropTypes.oneOf(['drafted','approved','rejected'])
  },

  render: function() {
    return (
      <div>
        <div>Points: {this.props.points}</div>
        <div>Code To Refactor: {this.props.code_to_refactor}</div>
        <div>Solution: {this.props.solution}</div>
        <div>Status: {this.props.status}</div>
      </div>
    );
  }
});
